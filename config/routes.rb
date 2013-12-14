KekeOfficialWebsite::Application.routes.draw do

  root to: "home#index"
  devise_for :users, :path => "account", :controllers => {
    :registrations => :account,
    :sessions => :sessions
  }
  
  # match '/apps' => 'home#apps', :via => :get, :as => 'apps'
  match '/about' => 'home#about', :via => :get, :as => 'about'
  
  resources :app_infos, :path => :apps
  
  namespace :cpanel do
    root to: "home#index"
    resources :app_infos, :path => :apps 
  end
  
end
