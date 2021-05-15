Rails.application.routes.draw do
  devise_for :users
  root to: "novels#index"
  resources :novels, only: [:index, :new, :create]
end
