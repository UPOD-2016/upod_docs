Rails.application.routes.draw do

  devise_for :users
  get 'categories/new'

  namespace :admin do
    resources :articles
    resources :users
    resources :categories
    resources :subcategories
    resources :article_blocks, only:[:index,:show]
    resources :article_text_blocks, only:[:index,:show]
    resources :article_image_blocks, only:[:index,:show]
    resources :article_diagram_blocks, only:[:index,:show]
    resources :article_equation_blocks, only:[:index,:show]
    resources :equation_block_variables, only:[:index,:show]
    resources :article_link_blocks, only:[:index,:show]
    resources :contributors, only:[:index,:show]
    resources :categorizations
    resources :diagrams
    resources :images

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
