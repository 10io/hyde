module Repositoryable
  extend ActiveSupport::Concern

  private

  def full_repo_param
    "#{org_param}/#{repo_param}"
  end

  def org_param
    params.permit(:org)[:org]
  end

  def repo_param
    params.permit(:repo_name)[:repo_name]
  end
end
