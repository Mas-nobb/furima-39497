Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items do
    resources :orders, only: [:index, :create]
   end
  get '/javascript/new.js', to: redirect('/new.js')
end
