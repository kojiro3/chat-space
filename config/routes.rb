Rails.application.routes.draw do
  devise_for :users
  root 'messages#index'
  resources :groups, only: [:create, :new, :edit, :update] do
    resources :messages, only: [:index]
  end
end
