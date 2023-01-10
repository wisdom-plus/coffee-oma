class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :unchecked_notifications?, if: :user_signed_in?

  INDEX_DISPALY_NUM = 9
  SHOW_DISPLAY_NUM = 5
# :nocov:
  def after_sign_in_path_for(_resource)
    products_path
  end

  private

    def unchecked_notifications?
      session[:checked] = current_user.notifications.exists?(checked: false) unless session[:checked]
    end

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: %i[username icon profile])
      devise_parameter_sanitizer.permit(:account_update, keys: %i[username icon profile])
    end
# :nocov:
end
