# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  before_action :user_exist?, only: [:show]
  before_action :check_guest, only: %i[destroy update]
  prepend_before_action :check_captcha, only: [:create]
  prepend_before_action :customize_sign_up_params, only: [:create]
  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  def create
    super
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  def update
    super
  end

  # DELETE /resource
  def destroy
    super
  end

  def show
    @user = User.includes(relationships: [:follow]).find(params[:id])
    @follow = current_user.follow_user(@user) if signed_in?
    @like = Like.where('user_id = ?', @user.id).includes(:product)
    @review = Review.where('user_id = ?', @user.id).includes(:product)
    return unless signed_in? && @user != current_user

    @room = if @user.id < current_user.id
              Room.find_room(@user, current_user)
            else
              Room.find_room(current_user, @user)
            end
  end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
  private

    def user_exist?
      redirect_to root_path, alert: 'ユーザーが存在しません' if User.find_by(id: params[:id]).nil?
    end

    def check_guest
      return unless resource.email == 'guest@example.com'

      redirect_to root_path, alert: 'ゲストユーザーは変更・削除ができません。'
    end

    def customize_sign_up_params
      devise_parameter_sanitizer.permit :sign_up, keys: %i[username email password password_confirmation remember_me]
    end

    def check_captcha
      self.resource = resource_class.new sign_up_params
      resource.validate
      return if verify_recaptcha(model: resource)

      respond_with_navigational(resource) { render :new }
    end

  protected

    def update_resource(resource, params)
      resource.update_without_current_password(params)
    end
end