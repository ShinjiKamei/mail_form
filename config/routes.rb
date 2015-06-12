#Rails.application.routes.draw do
MailForm::Application.routes.draw do
  #get "static_pages/home"
  
  #resources :users
  resources :inquiries, only: [:new, :create, :index, :destroy]
  
  root 'inquiries#new'
  #match '/help',    to: 'static_pages#help',    via: 'get'
  #match '/about',   to: 'static_pages#about',   via: 'get'
  
end
