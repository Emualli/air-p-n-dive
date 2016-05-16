Rails.application.routes.draw do
  devise_for :users
  root 'pages#home'
  resources :pools, except: [:destroy]
  resources :users, except: [:index, :destroy] do
    get 'bookings' => 'users#bookings'
    get 'my-pools' => 'users#pools'
  end
  resources :bookings, except: [:destroy]
end
