Rails.application.routes.draw do


  devise_for :users, controllers: {
    registrations: 'registrations'
  }

  resources :topics do
    resources :posts do
      resources :comments do
        resources :user_comment_ratings, only: [ :index, :create, :new, :edit, :update ]
      end
      resources :tags
      resources :stars
      post 'read', on: :member
    end
  end

  get '/posts', to: "posts#index"

  root to: "topics#index"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
