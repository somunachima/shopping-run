class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters,
    if: :devise_controller?

    protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:photo])
    devise_parameter_sanitizer.permit(:acccount_update, keys: [:photo])
  end
end
