class RepositoriesController < AuthenticatedController
  def index
    @repositories = Repository.with_suffix(".github.io")
  end
end
