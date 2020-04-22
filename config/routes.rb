Rails.application.routes.draw do
  get 'login', to: 'users#check'
  resources :users
  resources :instructors do
    resources :fly_classes
  end
end
