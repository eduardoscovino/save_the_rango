class SignaturesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_signatures, only: [:show, :edit, :destroy]

  def index
    @signatures = policy_scope(Signature).order(created_at: :desc)
  end

  def show
    authorize @signature
  end

  private

  def set_signatures
    @signature = Signature.find(params[:id])
  end

  def signature_params
    params.require(:signature).permit(:title, :type_of, :description, :price)
  end
end
