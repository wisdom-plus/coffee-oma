module Api
  module V1
    module Auth
      class SessionController < DeviseTokenAuth::SessionsController
        def guest_login
          @resource = User.guest
          create_and_assign_guest_login
          sign_in(:user, @resource, store: false, bypass: false)
          yield @resource if block_given?
          render_create_success
        end

        private

          def resource_params
            params.require(:session).permit(:email, :password)
          end

          def create_and_assign_guest_login
            if @resource.respond_to?(:with_lock)
              @resource.whith_lock do
                @token = @resource.create_token
                @resource.save!
              end
            else
              @token = @resource.create_token
              @resource.save!
            end
          end
      end
    end
  end
end
