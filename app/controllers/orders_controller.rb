class OrdersController < ApplicationController
  before_action :set_orders, only: [:destroy, :add_unit, :reduce_unit]  

  def create
    if current_user.basket
      basket = current_user.basket
    else
      basket = Basket.create(user: current_user)
    end

    order = Order.new
    order.basket = basket
    order.product = Product.find(params[:product_id])
    order.quantity = 1
    authorize order
    if order.save
      redirect_to products_path, notice: 'Product added to cart!'
    else
      render 'products/show'
    end
  end

  def add_unit
    # add unit to order
    @order.quantity +=1
    @order.save
    authorize @order
    redirect_to basket_path(current_user.basket)
  end

  def reduce_unit
    # reduce unit to order
    @order.quantity -= 1
    @order.save
    authorize @order
    redirect_to basket_path(current_user.basket)
  end

  def destroy
    @order.destroy
    authorize @order
    redirect_to basket_path(current_user.basket), notice: 'Product removed from cart'
  end

  private

  def set_orders
    @order = Order.find(params[:id])
  end
end
