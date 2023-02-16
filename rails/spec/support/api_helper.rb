module Requests
  module JsonHelpers
    def json
      JSON.parse(response.body)
    end

    def expect_json(object)
      JSON.parse(object.to_json)
    end
  end

  module AuthorizationHelpers
    def api_sign_in(user)
      user.confirm
      post new_api_v1_user_session_path, params: { session: { email: user.email, password: user.password } }

      response.headers.slice('access-token', 'client', 'uid', 'expiry', 'token-type')
    end
  end
end
