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
  
end
