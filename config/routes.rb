Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items, only: [:index, :show, :new, :create, :edit] do
    post :item_orders, on: :member
  end

  resources :test_drive_reservations, only: [:new, :create]
end
