Rails.application.routes.draw do
  root 'races#home'
  resources :users
  resources :races
  resources :hashtags

  get '/index' => 'pages#index'
  get '/authenticate' => 'underarmour_data#authenticate'
  get '/callback' => 'underarmour_data#callback'
end
