Rails.application.routes.draw do
  mount Attachinary::Engine => "/attachinary"
  devise_for :users
  root 'pages#home'
  resources :pools, except: [:destroy]
  resources :users, except: [:index, :destroy] do
    get 'bookings' => 'users#bookings'
    patch 'bookings/:id' => 'bookings#update'
    get 'my-pools' => 'users#pools'
  end
  resources :bookings, except: [:destroy]
end
