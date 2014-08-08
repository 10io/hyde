Rails.application.routes.draw do
  root "application#index"

  get "logout" => "application#logout"
  get "github/callback" => "github#callback"

  resources :repositories
end
