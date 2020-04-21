Rails.application.routes.draw do
  resources :instructors do
    resources :fly_classes
  end
end
