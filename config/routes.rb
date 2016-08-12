Rails.application.routes.draw do
  root 'home#index'
  resources :messages, except: [:new, :edit]
end
