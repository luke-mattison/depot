Rails.application.routes.draw do
  get "admin" => "admin#index"
  controller :sessions do
    get "login" => :new
    post "login" => :create
    delete "logout" => :destroy
  end

  get "sessions/create"
  get "sessions/destroy"
  get "up" => "rails/health#show", as: :rails_health_check
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  resources :users
  resources :products do
    get :who_bought, on: :member
  end

  scope "(:locale)" do
    resources :orders
    resources :line_items
    resources :carts
    root "store#index", as: "store_index", via: :all
  end
end
