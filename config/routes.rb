Rails.application.routes.draw do
  devise_for :users
  root :to => 'home#index'
  get "/users", to: "home#sign_in" 
end
