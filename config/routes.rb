KekeOfficialWebsite::Application.routes.draw do
  
  require 'api'

  root to: "home#index"
  devise_for :users, :path => "account", :controllers => {
    :registrations => :account,
    :sessions => :sessions
  }
  
  # match '/apps' => 'home#apps', :via => :get, :as => 'apps'
  match '/about' => 'home#about', :via => :get, :as => 'about'
  
  resources :apps, :only => [:index, :show]
  resources :links
  resources :questions, :only => [:index]
  resources :contacts, :path => :feedbacks, :only => [:new, :create]
  
  namespace :cpanel do
    root to: "home#index"
    resources :site_configs
    resources :apps
    # resources :app_infos, :path => :apps 
    # resources :app_platforms, :path => :platforms
    resources :banners, :path => :ads
    resources :feedbacks, only: [:index, :show, :destroy]
    resources :tracks, only: [:index, :destroy]
    resources :device_tokens, only: [:index, :destroy] 
    resources :twits, only: [:index, :new, :create]
    resources :questions
  end
  
  mount KeKe::API => "/"
  
end
