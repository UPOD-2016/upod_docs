Rails.application.routes.draw do

  namespace :admin do
    resources :articles
    resources :constants
    resources :users
#resources :article_text_blocks
#resources :article_blocks
#resources :article_constant_blocks
#resources :article_diagram_blocks
#resources :article_equation_blocks
#resources :article_link_blocks
#resources :contributors
#resources :diagrams
#resources :sessions

    root to: "articles#index"
  end

  devise_for :users
  get '/about' => 'static_pages#about'
  root to: 'static_pages#home'
  resources :articles
end
