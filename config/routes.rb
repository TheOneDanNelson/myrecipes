Rails.application.routes.draw do
  root 'pages#home'
  get 'pages/home', to: 'pages#home'
  get 'pages/about', to: 'pages#about'
 
  get '/recipes', to: 'recipes#index'
  get '/recipes/:id', to: 'recipes#show', as: 'recipe'
 
#  resources :recipes 
#  get "recipes", to: "recipes#index"
#  get "recipes/new", to: "recipes#new"
end
