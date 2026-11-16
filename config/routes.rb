Rails.application.routes.draw do
  resource :session
  resources :passwords, param: :token
  resource :settings, only: %i[ show update ]

  # 200 when the app boots; Kamal, Lookout and the dev healthcheck read it.
  get "up" => "rails/health#show", as: :rails_health_check

  root "dashboards#show"
end
