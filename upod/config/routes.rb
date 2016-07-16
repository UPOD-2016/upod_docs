Rails.application.routes.draw do

  get 'categories/new'

  namespace :admin do
    resources :articles
    resources :constants
    resources :users
    resources :categories
    resources :subcategories
#resources :categorizations
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
  resources :articles do
    get 'add_title_and_categories'
  end
  resources :images, only: :create
  #categories
  resources :categories
  resources :subcategories
  resources :categorizations
end
