class GithubController < ApplicationController
  def callback
    return head :unauthorized unless github_params[:state] == session.id
    json = Oj.load(RestClient.post(github_access_token_url, {}, "Accept" => "application/json"), :symbol_keys => true)
    session[:access_token] = json[:access_token]

    redirect_to :repos
  end

  private

  def github_params
    params.permit(:code, :state)
  end

  def github_access_token_url
    params = {
      :client_id => "9a7fe023ed43685db8a0",
      :client_secret => "3874d8cfcd4ebd0247c0dc181f2c9790666f9491",
      :code => github_params[:code]
    }

    URI::HTTPS.build(
      :host => "github.com",
      :path => "/login/oauth/access_token",
      :query => params.to_query
    ).to_s
  end
end
