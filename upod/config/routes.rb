Rails.application.routes.draw do

  devise_for :users
  get 'categories/new'

  namespace :admin do
    resources :articles
    resources :constants
    resources :users
    resources :categories
    resources :subcategories
    resources :article_blocks
    resources :article_text_blocks
    resources :article_constant_blocks
    resources :article_image_blocks
    resources :article_diagram_blocks
    resources :article_equation_blocks
    resources :equation_block_variables
    resources :article_link_blocks
    resources :contributors
    resources :categorizations
    resources :diagrams
    resources :images
    resources :sessions

    root to: "articles#index"
  end
  get '/about' => 'static_pages#about'
  root to: 'static_pages#home'
  resources :articles
  resources :article_diagram_blocks, only: :show
  resources :images, only: :create
  #categories
  resources :categories
  resources :subcategories
  resources :categorizations
end
