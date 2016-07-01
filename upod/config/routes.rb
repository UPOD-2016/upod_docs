Rails.application.routes.draw do
  get '/about' => 'static_pages#about'
  root to: 'static_pages#home'
  resources :articles
end
