class OrdersController < ApplicationController
  before_action :set_orders, only: [:destroy]  

  def create
    if current_user.basket
      basket = current_user.basket
    else
      basket = Basket.create(user: current_user)
    end

    order = Order.new
    order.basket = basket
    order.product = Product.find(params[:product_id])
    order.quantity = params[:quantity].to_i
    authorize order
    if order.save
      redirect_to basket_path(basket)
    else
      render 'products/show'
    end
  end

  def destroy
    @order.destroy
    authorize @order
    redirect_to basket_path(current_user.basket)
  end

  private

  def set_orders
    @order = Order.find(params[:id])
  end
end
