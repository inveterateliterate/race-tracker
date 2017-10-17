Rails.application.routes.draw do
  root 'pages#home'
  resources :users
  resources :races
  resources :hashtags, only: [:index, :create, :update, :destroy]

  constraints lambda { |req| req.format == :html } do
    get '*any', to: 'pages#home'
  end

  patch '/hashtags/:id/update_text' => 'hashtags#update_text'

  get '/authenticate' => 'underarmour_data#authenticate'
  get '/callback' => 'underarmour_data#callback'
end
