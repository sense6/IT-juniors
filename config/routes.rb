Rails.application.routes.draw do

  root to: 'offers#index'

  devise_for :users
  get "/users/sign_out" => "devise/sessions#destroy"
  get '/:locale' => 'offers#index'

  scope "/:locale" do
    get 'skills/create'
    get 'skills/destroy'
    get 'skills/update'
    resources :companies, :offers, :users
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
