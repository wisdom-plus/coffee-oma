module Api
  module Vi
    class HealthCotroller < ApiApplicationController
      def index
        render json: { status: 'ok' }
      end
    end
  end
end
