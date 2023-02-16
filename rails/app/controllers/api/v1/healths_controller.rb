module Api
  module V1
    class HealthsController < ApplicationController
      def index
        render json: { status: 'ok' }
      end
    end
  end
end
