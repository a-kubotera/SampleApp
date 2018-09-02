Rails.application.routes.draw do
  root 'top#index'
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  unless Rails.env.production?
    namespace :debug do
      get    'login'   => 'sessions#new'
      post   'login'   => 'sessions#create'
      get    'logout'  => 'sessions#new'
      delete 'logout'  => 'sessions#destroy'
    end
  end

  resource :profile, only: [:new, :create, :edit, :update] do
    post :confirm, on: :collection
  end

  # APIの実装テスト
  # defaultsを付けると http://~~/○○.json みたいに.jsonがつかない 

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :profiles
    end
  end  
end
