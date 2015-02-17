module ApplicationHelper
  def github_signin_url
    params = {
      :client_id => "9a7fe023ed43685db8a0",
      :scope => "repo",
      :state => session.id
    }

    URI::HTTPS.build(
      :host => "github.com",
      :path => "/login/oauth/authorize",
      :query => params.to_query
    ).to_s
  end
end
