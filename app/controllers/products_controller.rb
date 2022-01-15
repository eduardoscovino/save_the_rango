class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: %I[index show]

  def index
    if params[:query].present?
      @products = policy_scope(Product).where("name ILIKE ?", "%#{params[:query]}%").includes([photo_attachment: :blob])
    else
      @products = policy_scope(Product).order(created_at: :desc).includes([photo_attachment: :blob])
    end

    respond_to do |format|
      format.html # Follow regular flow of Rails
      format.text { render partial: 'list.html', locals: { products: @products } }
    end
  end

  def show
    @product = Product.find(params[:id])
    authorize @product
  end
end
