class ApplicationController < ActionController::Base
  protect_from_forgery :with => :exception

  def welcome
  end

  private

  def current_client
    @current_client ||= Octokit::Client.new(:access_token => session[:access_token])
  end
end
