Rails.application.routes.draw do

  devise_for :admins
  devise_for :users
  
  root 'restaurants#index'
  resources :restaurants do
    resources :reviews
  end

  resources :tags do 
    resources :restaurants
  end
  
end
