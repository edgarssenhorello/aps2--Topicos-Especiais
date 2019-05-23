Rails.application.routes.draw do
  root to:"home#index"
  resources :personagens, :poderes
end




