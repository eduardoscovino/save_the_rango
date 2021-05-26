class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:query].present?
      @products = policy_scope(Product).where("name ILIKE ?", "%#{params[:query]}%")
    else
      @products = policy_scope(Product).order(created_at: :desc)
    end
  end

  def show
    @product = Product.find(params[:id])
    authorize @product
  end
end
