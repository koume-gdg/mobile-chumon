class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:shop_name, :owner_name, :owner_phone_number, :shop_address, :shop_city, :email])
  end
end
