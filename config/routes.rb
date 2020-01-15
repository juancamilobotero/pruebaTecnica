Rails.application.routes.draw do
  resources :parkings
  resources :principals
  root to: 'parkings#new'
  get '/exit', to: 'parkings#exit' 
  get '/salida_vehiculo', to: 'parkings#salida_vehiculo' 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
