class ReposController < ApplicationController
  include Repositoryable

  def index
    @repos = Repo.all
  end

  def show
    @pages = Content.path(:repo => full_repo_param, :path => "pages")
    @posts = Content.path(:repo => full_repo_param, :path => "posts")
  end
end
