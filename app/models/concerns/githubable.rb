module Githubable
  extend ActiveSupport::Concern

  class_methods do
    def client
      RequestStore.store[:client]
    end
  end

  private

  def client
    RequestStore.store[:client]
  end
end
