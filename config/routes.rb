Rails.application.routes.draw do
  devise_for :users
  resources :personal_infos, only: %i[new create edit update]
  resources :resume, only: %i[index]
  root :to => 'personal_infos#new'
  get "/users", to: "home#sign_in" 
end
