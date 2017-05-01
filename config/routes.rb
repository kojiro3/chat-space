Rails.application.routes.draw do
  devise_for :users
  root 'group#index'
  resources :groups, only: [:index, :create, :new, :edit, :update] do
    resources :messages, only: [:index]
  end
end
