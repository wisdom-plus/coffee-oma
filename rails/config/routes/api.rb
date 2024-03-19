# 外部に対して公開しているapiのルーティングを記述する

namespace :api, format: 'json' do
  namespace :v1 do
    resources :healths, only: %i[index]
    resources :products, only: %i[index show create] do
      resources :reviews, only: %i[create destroy] do
        collection do
          get 'exists'
        end
      end
    end
    resources :likes, only: %i[create destroy index] do
      collection do
        get 'exists'
      end
    end
    resources :relationships, only: %i[create destroy] do
      collection do
        get 'exists'
      end
    end
    # mount_devise_token_auth_for 'User', at: 'auth', controllers: {
    #   registrations: 'api/v1/auth/registrations',
    #   token_validations: 'api/v1/auth/token_validations',
    #   passwords: 'api/v1/auth/passwords',
    #   sessions: 'api/v1/auth/sessions'
    # }
  end
end
