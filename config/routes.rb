Majordomo::Application.routes.draw do
  
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :assets do
    member do
      get :qrcode
    end
  end

  root :to => 'home#index'
end
