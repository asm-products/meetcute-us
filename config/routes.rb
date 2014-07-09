SiteService::Application.routes.draw do

  devise_for :users, controllers: {registrations: "registrations", sessions: "sessions"}

  resources :users, shallow: true do
    resource :account
    resource :site
    resources :subscriptions
  end

  resources :designs
  resources :plans
  resources :events

  constraints(Subdomain) do
    get "/" => "sites#show"
  end

  root 'main#index'
end
