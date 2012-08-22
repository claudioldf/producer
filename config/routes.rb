Producer::Application.routes.draw do

  root to: 'pages#index'
  get "pages/index"
  match '/home'   => "pages#index",  :as => :home
  match '/prices' => "pages#prices", :as => :prices
  match '/tour'   => "pages#tour",   :as => :tour

  resources :posts, only: [:index, :show] do
    resources :comments, :only => [:create]
  end

  namespace :admin do
    resources :posts
    resources :categories, except: [:show]
  end

end
