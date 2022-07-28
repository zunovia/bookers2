Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
get "/home/about" => "homes#about", as: "about"

  resources :books, only: [:new, :create, :index, :show, :destroy,:edit,:update] do
    resource :favorites, only: [:create, :destroy]

  end
  resources :users, only: [:show,:index,:edit,:update]
end
