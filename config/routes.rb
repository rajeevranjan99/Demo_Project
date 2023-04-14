Rails.application.routes.draw do
  # devise_for :users, controllers: 
  # sessions: 'users/sessions'
  devise_for :users
  get 'users/index'
  #delete 'airports/:id', to: 'airports#destroy', as: 'destroy', only: :destroy
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: "users#index"
 # match "/users/sign_up/:initial_role" => 'devise/registrations#new', :as => 'new_user_with_role'
 devise_scope :user do
  get "/users/sign_up/:initial_role" => 'devise/registrations#new', :as => 'new_user_with_role'
end
  resources :admins,:managers,:executives,:airports,:flights,:ports,:schedules
 
end
