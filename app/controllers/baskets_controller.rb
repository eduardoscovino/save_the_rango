class BasketsController < ApplicationController
  before_action :set_baskets, only: [:show, :update, :destroy, :checkout]
  skip_before_action :verify_authenticity_token

  def show
    authorize @basket
  end

  def update
    @basket.update(basket_params)
    redirect_to basket_path(@basket)
  end

  def destroy
    @basket.destroy
    authorize @basket
    Basket.create(user: current_user)
    redirect_to products_path
  end

  def checkout
    authorize @basket
  end

  private

  def set_baskets
    @basket = Basket.find(params[:id])
  end

  def basket_params
    params.require(:basket).permit(:user_id)
  end
end
