Rails.application.routes.draw do
  devise_for :users,
              controllers: {omniauth_callbacks: "users/omniauth_callbacks"}
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    root "static_pages#home"
    get "/thanks",              to: "static_pages#thanks"
    get "/topics/:id",          to: "static_pages#reviews_about", as: "topic"
    get "/statistics",          to: "static_pages#statistic"
    get "/signup",              to: "users#new"
    get "/login",               to: "sessions#new"
    get "/success",             to: "checkout#success"
    get "/cancel",              to: "checkout#cancel"
    post "/login",              to: "sessions#create"
    delete "/logout",           to: "sessions#destroy"
    resources :reviews do
      member do
        put :check
        put :like
      end
    end
    resources :comments do
      member do
        put :check
      end
    end
    resources :ratings
    resources :bookings
    resources :checkout, only: :create
    resources :billing,  only: :create
    resources :webhooks, only: :create
    resources :revenues, only: :index
    resources :tours
    resources :tags
    resources :users
    resources :categories
    resources :reviews do
      resources :comments
    end
    namespace :admin do
      resources :users,  only: [:new, :create]
      resources :tours, only: :index
    end
    resources :popular, only: :create
  end
end
