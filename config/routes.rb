Rails.application.routes.draw do
  root 'races#home'
  resources :users do
    resources :races, only: [:index, :new, :edit, :destroy]
  end

  resources :races, only: [:create, :update] do
    resources :tweets, only: [:index]
  end

  get '/authenticate' => 'underarmour_data#authenticate'
  get '/callback' => 'underarmour_data#callback'
end
