Rails.application.routes.draw do
  get 'users/index'

  get 'users/show'

  get 'users/edit'

  root to: 'offers#index'
  resources :companies, :offers

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
