Rails.application.routes.draw do
  resources :repos, :only => %i(index)
  get "/repos/:org/:repo_name/tree/:branch" => "repos#show", :constraints => { :repo_name => /[^\/]+/ }
  get "/repos/:org/:repo_name/tree/:branch/*path" => "contents#show", :constraints => { :repo_name => /[^\/]+/ }

  get "/github/handshake" => "github#handshake"
  root :to => "application#welcome"
end
