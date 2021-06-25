class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  INDEX_DISPALY_NUM = 9.freeze
  SHOW_DISPLAY_NUM = 5.freeze

  def after_sign_in_path_for(_resource)
    products_path
  end

  def self.render_with_signed_in_user(user, *args)
    ActionController::Renderer::RACK_KEY_TRANSLATION['warden'] ||= 'warden'
    proxy = Warden::Proxy.new({}, Warden::Manager.new({})).tap { |i| i.set_user(user, scope: :user) }
    renderer = self.renderer.new('warden' => proxy)
    renderer.render(*args)
  end

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: %i[username icon profile])
      devise_parameter_sanitizer.permit(:account_update, keys: %i[username icon profile])
    end
end
