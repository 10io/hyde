class ReposController < ApplicationController
  def index
    @repos = repos
  end

  def show
  end

  private

  def repos
    (current_client.repositories + org_repos).flatten
  end

  def org_repos
    current_client.organizations.map do |org|
      current_client.repositories(org.login)
    end
  end
end
