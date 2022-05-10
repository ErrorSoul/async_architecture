Rails.application.routes.draw do
  use_doorkeeper
  resources :accounts do
    get :sign_up, on: :collection
    delete :log_out, on: :collection
    get :current, on: :collection
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "accounts#index"

  get "sign_up" => "accounts#sign_up"
  delete "log_out" => "accounts#log_out"
  # Defines the root path route ("/")


end
