Rails.application.routes.draw do
  root 'pages#home'
  get 'pages/home', to: 'pages#home'
  get 'pages/about', to: 'pages#about'
 
  resources :recipes 
  #resources chef
#  get "recipes", to: "recipes#index"
#  get "recipes/new", to: "recipes#new"
end
