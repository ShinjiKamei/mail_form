#Rails.application.routes.draw do
MailForm::Application.routes.draw do
  #get "static_pages/home"
  
  #resources :users
  #resources :sessions,      only: [:new, :create, :destroy]
  
  root 'mail_forms#index'
  #match '/help',    to: 'static_pages#help',    via: 'get'
  #match '/about',   to: 'static_pages#about',   via: 'get'
  
end