Rails.application.routes.draw do
  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'

  #resources :organisations

  jsonapi_resources :organisations

end
