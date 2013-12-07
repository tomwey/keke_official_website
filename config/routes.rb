KekeOfficialWebsite::Application.routes.draw do

  resources :app_infos, :path => :apps
  
  root to: "home#index"
  devise_for :users, :path => "account", :controllers => {
    :registrations => :account,
    :sessions => :sessions
  }
  
  namespace :cpanel do
    root to: "home#index"
    resources :app_infos, :path => :apps 
  end
  
end
