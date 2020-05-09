Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'dashboard#index'
  resources :reminders
  post '/reminders/confirm', to: 'reminders#confirm'
  get '/reload_header_info', to: 'dashboard#reload_header_info'
end
