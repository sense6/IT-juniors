Rails.application.routes.draw do

  root to: 'offers#index'
  resources :companies, :offers

  get 'skills/create'

  devise_for :users

  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
