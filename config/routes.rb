Rails.application.routes.draw do
  scope module: :admins do
    devise_for :admins
  end

  scope module: :users do
    devise_for :users, controllers: {
      registrations: 'users/registrations',
    }
  end

  get "/" => "homes#top", as: "root"
  get "/about" => "homes#about"
  get "/contact" => "homes#contact"
  get "/howto" => "homes#howto"

  resources :users, only: [:show, :edit, :update]

  namespace :admins do
    get "index" => "homes#index", as: "index"
    get "rank"  => "homes#rank",  as: "rank"
    get "chart" => "homes#chart", as: "chart"
    resources :users, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
      collection do
        post :import
      end
    end
    resources :departments, only: [:index, :create, :edit, :update, :destroy] do
      collection do
        post :import
      end
    end
  end

  get "posts/finish" => "posts#finish"
  get "posts/rank" => "posts#rank"
  resources :posts, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
    resource  :favorites,     only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end

  resources :notifications, only: [:index, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
