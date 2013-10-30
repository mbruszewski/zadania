Zad1::Application.routes.draw do
  root to: 'main#index'

  match "/zad1" => "zad1#index", as: :zad1
  match "/zad2" => "zad2#index", as: :zad2
  match "/login" => "sessions#new", as: :login
  match "/logout" => "sessions#destroy", as: :logout
  resources :groups
  resources :users
  resources :sessions

end
