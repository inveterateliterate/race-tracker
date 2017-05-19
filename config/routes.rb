Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'races#home'
  resources :users
  resources :races

  get '/authenticate' => 'underarmour_data#authenticate'
  # get '/auth/mapmyfitness/callback' => 'underarmour_data#callback'
  get '/callback' => 'underarmour_data#callback'
end
