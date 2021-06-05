Rails.application.routes.draw do
  devise_for :users
  root to: "novels#index"
  resources :novels do
    resources :tips, only: [:create, :index]
  end
end
