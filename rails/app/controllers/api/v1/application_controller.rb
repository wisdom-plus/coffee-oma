class ApiApplicationControler < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  before_action :request_non

  def request_non
    request.session_options[:skip] = true
  end
end
