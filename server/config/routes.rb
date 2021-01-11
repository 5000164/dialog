Rails.application.routes.draw do
  resources :groups, only: [:index] do
    resources :statements, only: [:index, :create]
  end
  resources :candidates, only: [:create]
end
