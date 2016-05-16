Rails.application.routes.draw do
  resources :pools, except: [:destroy]
  resources :users, except: [:destroy]
  resources :bookings, except: [:destroy]
end
