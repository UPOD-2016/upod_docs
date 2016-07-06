Rails.application.routes.draw do
  devise_for :users
  get '/about' => 'static_pages#about'
  root to: 'static_pages#home'
  resources :articles
end
