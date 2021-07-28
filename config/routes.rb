Rails.application.routes.draw do
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    root "users#new"
    get "/signup", to: "users#new"
    resources :users
  end
end
