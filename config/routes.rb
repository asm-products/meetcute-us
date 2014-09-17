SiteService::Application.routes.draw do

  devise_for :users, controllers: {registrations: "registrations", sessions: "sessions"}

  resources :users, shallow: true do
    resource :account
    resource :site
    resources :subscriptions
  end

  resources :galleries, shallow: true do
    resources :images
  end

  resources :designs
  resources :plans
  resources :events
  resources :stories

  constraints(Subdomain) do
    get "/" => "sites#show"
  end

  root 'main#index'
end
