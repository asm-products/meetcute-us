SiteService::Application.routes.draw do

  devise_for :users, controllers: {registrations: "registrations"}
  
  resources :users, shallow: true do
    resource :account
    resource :site
    resources :subscriptions
  end
  
  resources :designs
  resources :plans

  root 'main#index'
end
