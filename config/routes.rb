Rails.application.routes.draw do
  devise_for :users,
              controllers: {omniauth_callbacks: "users/omniauth_callbacks"}
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    root "static_pages#home"
    get "/thanks",    to: "static_pages#thanks"
    get "/food",      to: "static_pages#reviewfood"
    get "/place",     to: "static_pages#reviewplace"
    get "/signup",    to: "users#new"
    get "/login",     to: "sessions#new"
    get "/success",   to: "checkout#success"
    get "/cancel",    to: "checkout#cancel"
    post "/login",    to: "sessions#create"
    delete "/logout", to: "sessions#destroy"
    resources :bookings
    resources :checkout, only: :create
    resources :billing,  only: :create
    resources :webhooks, only: :create
    resources :revenues, only: :index
    resources :tours
    resources :users
    resources :categories
    resources :reviews
    namespace :admin do
      resources :users,  only: [:new, :create]
    end
  end
end
