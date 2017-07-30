Rails.application.routes.draw do
  devise_for :admins
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "root#show"
  get "/informations",    to: "info#show"
  get "/colles",    to: "colles#show"

  namespace :user do
    get "/profile", to: "profile#show"
  end
end
