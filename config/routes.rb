Rails.application.routes.draw do

  get 'bookings/index'

  get 'bookings/show'

  resources :motels, only: [:index, :show] do
    resources :rooms, only: [:index, :show]
    resources :bookings, only: [:index]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
