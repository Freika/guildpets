Rails.application.routes.draw do
  root 'guilds#index'
  resources :characters
  resources :guilds do
    post :get_rating, on: :member
  end
end
