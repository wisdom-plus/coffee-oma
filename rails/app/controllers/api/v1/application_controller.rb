class ApiApplicationControoler < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  before_actin :request_non

  def request_non
    request.session_options[:skip] = true
  end
end
