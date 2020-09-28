Rails.application.routes.draw do
  devise_for :users
  resources :personal_infos, only: %i[new create edit update]
  resources :resumes, only: %i[index]
  root :to => 'resumes#index'
  get "/users", to: "home#sign_up" 
end
