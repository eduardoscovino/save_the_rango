class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!, :set_cart, :orders_count
  around_action :switch_locale

  include Pundit

  # Pundit: white-list approach.
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: %I[first_name last_name role])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: %I[first_name last_name role])
  end

  def set_cart
    # set to be inherited as this method was redundant in a bunch of controllers
    return @basket = current_user.basket unless current_user.nil?
  end

  def orders_count
    # count cart products quantity, to display on cart icon of navbar
    @orders_count = 0
    unless @basket.nil?
      @basket.orders.each do |order|
        @orders_count += order.quantity
      end
    end
  end

  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
    { locale: I18n.locale == I18n.default_locale ? nil : I18n.locale }
  end

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end

  def switch_locale(&action)
    locale = params[:locale] || I18n.default_locale
    I18n.with_locale(locale, &action)
  end
end
