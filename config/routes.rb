Majordomo::Application.routes.draw do
  #devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
   devise_for :users


  resources :assets

  root :to => 'home#index'
end
