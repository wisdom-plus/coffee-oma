module Api
  module V1
    module Auth
      class PasswordsController < DeviseTokenAuth::PasswordsController
        before_action :request_non

        def request_non
          request.session_options[:skip] = true
        end
      end
    end
  end
end
