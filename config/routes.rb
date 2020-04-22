Rails.application.routes.draw do
  root 'static#home'
  get 'login', to: 'users#check'
  resources :users
  resources :instructors do
    resources :fly_classes
  end
end
