Rails.application.routes.draw do
  root 'motels#index'

  resources :motels, only: [:index, :show] do
    resources :rooms, only: [:index, :show]
    resources :bookings, only: [:index]
  end
end
