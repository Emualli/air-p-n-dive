Rails.application.routes.draw do
  mount Attachinary::Engine => "/attachinary"
  devise_for :users
  root 'pages#home'
  resources :pools, except: [:destroy] do
    get 'agendas' => 'pools#availability'
    resources :agendas, only: :create
  end
  get 'searchjson' => 'pools#searchjson'
  resources :users, except: [:index, :destroy] do
    get 'bookings' => 'users#bookings'
    get 'my-pools' => 'users#pools'
  end
  resources :bookings, except: [:destroy] do
    post 'cancel' => 'bookings#cancel'
    post 'pay' => 'bookings#pay'
    post 'accept' => 'bookings#accept'
    post 'reject' => 'bookings#reject'
  end
end
