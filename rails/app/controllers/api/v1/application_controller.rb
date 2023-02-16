module Api
  module V1
    class ApplicationController < ActionController::API
      include DeviseTokenAuth::Concerns::SetUserByToken
      before_action :request_non

      def request_non
        request.session_options[:skip] = true
      end
    end
  end
end
