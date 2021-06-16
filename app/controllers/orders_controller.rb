class OrdersController < ApplicationController
  before_action :set_orders, only: [:destroy, :add_unit, :reduce_unit]  

  def create
    basket = current_user.basket
    order = Order.new
    order.basket = basket
    order.product = Product.find(params[:product_id])
    product = order.product
    order.quantity = 1
    authorize order
    order.save
  end

#   When i go to show product my add to cart is not redirecting to my basket
# its because you took of the redirect to in the create method because of the index products page
# me advise: add a condition to redirect if the Product.find(params[:product_id]) exists - that means that you are in the show page!!
# redirect_to basket_path(basket) if Product.find(params[:product_id])
  # if order.save
  #   redirect_to basket_path(basket)
  # else
  #   render 'products/show'
  # end

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
