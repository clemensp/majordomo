Majordomo::Application.routes.draw do
  
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :asset_logs, only: [:index]

  resources :assets do
    member do
      get :qrcode
      post :return
      post :borrow
    end
  end

  match '/:id' => "shortener/shortened_urls#show"
  match '/assets/:uuid/borrowed_status' => "assets#borrowed_status"

  root :to => 'home#index'
end
