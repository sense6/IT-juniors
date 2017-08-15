Rails.application.routes.draw do
  get 'companies/show'

  get 'companies/index'

  root to: 'offers#index'
  
  get 'offers/index'
  get 'offers/show'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
