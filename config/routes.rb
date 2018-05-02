Rails.application.routes.draw do
	root to: 'clients#index'
  resources :employee_hours
  resources :clients
  resources :addresses
  resources :expenses
  resources :funding_infos
  resources :jobs
  resources :users
  resources :vendors

  get '/403.html', to: 'application#denied', as: :denied

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
