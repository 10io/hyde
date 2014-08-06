Rails.application.routes.draw do
  root "application#index"
  get "github/callback" => "github#callback"
end
