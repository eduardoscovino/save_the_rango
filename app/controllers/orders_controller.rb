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
    order.save
  end

  def add_unit
    # add unit to order
    @order.quantity +=1
    @order.save
    authorize @order
    redirect_to basket_path(current_user.basket, anchor: "order-#{@order.id}")
  end

  def reduce_unit
    # reduce unit to order
    @order.quantity -= 1
    @order.save
    authorize @order
    redirect_to basket_path(current_user.basket, anchor: "order-#{@order.id}")
  end

  def destroy
    @order.destroy
    authorize @order
    redirect_to basket_path(current_user.basket, anchor: "order-#{@order.id - 1}"), notice: 'Product removed from cart'
  end

  private

  def set_orders
    @order = Order.find(params[:id])
  end
end
