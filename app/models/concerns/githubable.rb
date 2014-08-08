module Githubable
  extend ActiveSupport::Concern

  module ClassMethods
    def gh_client
      RequestStore.store[:gh_client] ||= Octokit::Client.new(:access_token => session[:access_token])
    end
  end

  private

  def gh_client
    RequestStore.store[:gh_client] ||= Octokit::Client.new(:access_token => session[:access_token])
  end
end
