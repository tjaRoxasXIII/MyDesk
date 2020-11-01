Rails.application.routes.draw do
  resources :computers
  devise_for :admins, :controllers => {registrations: 'admin_registrations' }
  resources :tickets
  devise_for :users, :controllers => {registrations: 'user_registrations' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "tickets#index"
end
