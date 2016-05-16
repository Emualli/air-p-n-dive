Rails.application.routes.draw do
  devise_for :users
  root 'pools#index'
  resources :pools, except: [:destroy]
  resources :users, except: [:destroy]
  resources :bookings, except: [:destroy]
end
