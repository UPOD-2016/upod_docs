Rails.application.routes.draw do
  namespace :admin do
    resources :articles
resources :users
resources :constants
resources :contributors

    root to: "articles#index"
  end

  devise_for :users
  get '/about' => 'static_pages#about'
  root to: 'static_pages#home'
  resources :articles
end
