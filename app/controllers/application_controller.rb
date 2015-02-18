class ApplicationController < ActionController::Base
  protect_from_forgery :with => :exception

  before_action :set_client

  def welcome
  end

  private

  def client
    @client ||= Octokit::Client.new(:access_token => session[:access_token])
  end

  def set_client
    RequestStore.store[:client] = client
  end
end
