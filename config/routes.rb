Rails.application.routes.draw do
  resources :repos, :only => %i(index show)
  get "/github/callback" => "github#callback"
  root :to => "application#welcome"
end
