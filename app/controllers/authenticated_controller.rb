class AuthenticatedController < ApplicationController
  include Githubable
  before_action :authenticate!

  private

  def authenticate!
    redirect_to(root_url, :alert => "You need to authenticated to access this page") unless authenticated?
  end

  def authenticated?
    session[:access_token] && gh_client && has_permissions?
  end

  def has_permissions?
    gh_client.scopes.include?("repo")
  end
end
