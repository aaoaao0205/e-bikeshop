Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items, only: [:index, :show, :new, :create] do
    post :add_to_cart, on: :member
  end
end


