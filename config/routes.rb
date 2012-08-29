Producer::Application.routes.draw do

  scope '/admin' do
    devise_for :users, :controllers => {
      :sessions => "admin/sessions",
      :passwords => "admin/passwords"
    }
  end

  root to: 'pages#index'
  get "pages/index"
  match '/home'   => "pages#index",  :as => :home
  match '/prices' => "pages#prices", :as => :prices
  match '/tour'   => "pages#tour",   :as => :tour

  resources :posts, only: [:index, :show] do
    resources :comments, :only => [:create]
  end

  resources :inquiries, 
            :only => [:new, :create], 
            :path => "contact"

  namespace :admin do
    root to: "posts#index"
    resources :users, :except => [:show]
    resources :posts
    resources :categories, except: [:show]
    resources :assets
    resources :inquiries
  end

end
