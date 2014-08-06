class GithubController < ApplicationController
  def callback
    response = RestClient.post("https://github.com/login/oauth/access_token",
                    {
                      :client_id => Hyde::Application.config.gh_client_id,
                      :client_secret => Hyde::Application.config.gh_client_secret,
                      :code => params[:code]
                    },
                    :accept => :json)
    session[:access_token] = JSON.parse(response)['access_token']
  end
end
