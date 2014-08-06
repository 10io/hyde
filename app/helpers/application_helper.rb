module ApplicationHelper
  def client_id
    Hyde::Application.config.gh_client_id
  end
end
