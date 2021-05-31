class SubscriptionsController < ApplicationController
  before_action :set_subscriptions, only: [:destroy]
  skip_before_action :verify_authenticity_token

  def new
    @signature = Signature.find(params[:signature_id])
    @subscription = Subscription.new
  end

  def show
    @subscription = Subscription.find(params[:id])
    authorize @subscription
  end

  def create
    @subscription = Subscription.new
    @subscription.user = current_user
    @subscription.signature = Signature.find(params[:signature_id])
    @subscription.save!

    authorize @subscription
    redirect_to subscription_path(@subscription)

  end

  def checkout
    @subscription = Subscription.find(params[:id])
    authorize @subscription
  end

  def destroy
    # subscription.destroy
    # authorize subscription
    # redirect_to signature_path
  end

 private

  def set_subscriptions
    @subscription = Subscription.find(params[:id])
  end

  def subscription_params
    params.require(:subscription).permit(:user_id, :signature_id)
  end

end
