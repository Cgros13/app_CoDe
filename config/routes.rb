Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :visits, only: [:create, :show]
      resources :users, only: [:index]
    end
  end
  # Defines the root path route ("/")
  # root "articles#index"
end
