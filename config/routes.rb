Rails.application.routes.draw do
  scope module: :admins do
    devise_for :admins
  end

  scope module: :users do
    devise_for :users
  end

  get "/" => "homes#top", as: "root"
  get "/about" => "homes#about"
  get "/contact" => "homes#contact"

  resources :users, only:[:show, :edit, :update]

  namespace :admins do
    get "top" => "homes#top", as: "top"
    resources :users, only:[:index, :new, :create, :show, :edit, :update, :destroy]
    resources :departments, only:[:index, :create, :edit, :update, :destroy]
  end

  get "posts/finish" => "posts#finish"
  get "posts/rank" => "posts#rank"
  # get "posts/search" => "posts#search"
  resources :posts, only:[:index, :new, :create, :show, :edit, :update, :destroy]do
    resource :favorites, only:[:create, :destroy]
    resources :post_comments, only:[:create, :edit, :update, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
