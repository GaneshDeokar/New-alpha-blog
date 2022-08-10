Rails.application.routes.draw do
  root 'home#home'
  resources :articles,only: [:show,:index,:new,:create,:edit,:update,:destroy]
  resources :articles
  get 'signup', to:'users#new'
  resources:users, except:[:new]
end
