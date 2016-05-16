Rails.application.routes.draw do
  devise_for :users
  root 'pages#home'
  resources :pools, except: [:destroy]
  resources :users, except: [:destroy]
  resources :bookings, except: [:destroy]
end
