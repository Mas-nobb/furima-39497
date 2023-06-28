Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items

  get '/javascript/new.js', to: redirect('/new.js')
end
