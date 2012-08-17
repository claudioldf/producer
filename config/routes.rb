Producer::Application.routes.draw do

  root to: 'pages#index'
  get "pages/index"

  resources :posts, only: [:index, :show] do
    resources :comments, :only => [:create]
  end

  namespace :admin do
    resources :posts
    resources :categories, except: [:show]
  end

end
