Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  # get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  mount ActionCable.server => '/cable'
  resources :users, only: [:create]
  post '/login', to: 'auth#login'
  get '/auth/me', to: 'session#show_current_user'

  resources :channels, only: [:index, :create, :show] do
    resources :messages, only: [:index, :create]
  end
end
