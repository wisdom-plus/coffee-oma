# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  before_action :user_exist?, only: [:show]
  before_action :check_my_page, only: [:show], if: :user_signed_in?
  before_action :authenticate_user!, only: [:my_page]
  before_action :check_guest, only: %i[destroy update]
  # スーパークラスのメソッドを指定している
  prepend_before_action :customize_sign_up_params, only: [:create]
  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  def show
    @user = User.find_user(params[:id])
    @likes = Like.like_includes(@user.id)
    @reviews = Review.user_review(@user)
    @followers = @user.followers
    @followings = @user.followings

    return unless user_signed_in?

    @follow = Follow.new(current_user, @user).follow_user
    @room = Room.find_room(current_user.id, @user.id)
  end

  def my_page
    return redirect_to users_my_page_path, status: :see_other if current_user.id == params[:id].to_i

    @likes = Like.like_includes(@current_user.id)
    @reviews = Review.user_review(@current_user)
    @followers = @current_user.followers
    @followings = @current_user.followings
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
      redirect_to root_path, alert: t('.alert'), status: :see_other if User.find_by(id: params[:id]).nil?
    end

    def check_guest
      return unless resource.email == 'guest@example.com'

      redirect_to root_path, alert: t('.alert'), status: :see_other
    end

    def check_my_page
      redirect_to users_my_page_path, status: :see_other if current_user.id == params[:id].to_i
    end

    def customize_sign_up_params
      devise_parameter_sanitizer.permit :sign_up, keys: %i[username email password password_confirmation remember_me]
    end

  protected

    def update_resource(resource, params)
      resource.update_without_current_password(params)
    end
end
