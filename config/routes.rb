Rails.application.routes.draw do
  resources :issue_types, only: [:index, :new, :create, :destroy]
  resources :computers
  resources :tickets
  get '/tickets/home'
  get '/most_common_issue', to: 'tickets#most_common_issue'
  
  resources :user, only: [:show] do
    resources :tickets
  end

  devise_for :users, :controllers => {registrations: 'user_registrations', omniauth_callbacks: "omniauth_callbacks"}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "tickets#home"
end
