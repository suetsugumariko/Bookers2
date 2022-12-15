Rails.application.routes.draw do
 devise_for :users
  root to: 'homes#top'
  get "/homes/about" => "homes#about", as: "about"

  resources :users, only:[:new, :index, :show, :edit, :update, :create]
  resources :books, only:[:new, :index, :show, :edit, :create, :create, :update, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
