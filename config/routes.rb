Rails.application.routes.draw do
  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "root#show"
  get "/colles", to: "colles#show"

  namespace :user do
    get "/profile", to: "profile#show"
    get "/downloads", to: "downloads#show"
    get "/informations", to: "info#show"
  end

  namespace :api do
    namespace :v1 do
      resources :documents, only: [:create]
    end
  end
end
