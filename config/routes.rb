Rails.application.routes.draw do

  root to: 'offers#index'

  devise_for :users
  get "/users/sign_out" => "devise/sessions#destroy"
  get '/:locale' => 'offers#index'

  scope "/:locale" do
    get 'skills/create'
    get 'skills/destroy'
    get 'skills/update'
    get 'skills_requirement/create'
    get 'skills_requirement/destroy'
    get 'skills_requirement/update'
    resources :companies, :offers, :users
  end

end
