Rails.application.routes.draw do
  root 'motels#index'

  resources :bookings, only: [:index]
  resources :motels, only: [:index, :show] do
    resources :rooms, only: [:index, :show]
  end
end
