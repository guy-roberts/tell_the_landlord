Rails.application.routes.draw do
  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'

  jsonapi_resources :reports
  jsonapi_resources :profiles
  jsonapi_resources :organisations
end
