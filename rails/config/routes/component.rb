# turbo_streamコンポーネントのルーティング
namespace :component do
  resources :likes, only: [] do
    collection do
      get 'home'
      get 'user_show'
      get 'product'
      get 'bean'
    end
  end
  resources :reviews, only: [] do
    collection do
      get 'home'
      get 'list'
      get 'user_show'
    end
  end
  resources :bean_reviews, only: [] do
    get 'list', on: :collection
  end
  resources :notifications, only: [] do
    collection do
      get 'bell'
      get 'follow'
      get 'like'
      get 'message'
    end
  end
  resources :relationships, only: [] do
    collection do
      get 'followings_user_show'
      get 'followers_user_show'
    end
  end
end
