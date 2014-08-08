class ApplicationController < ActionController::Base
  protect_from_forgery :with => :exception

  def index
  end

  def logout
    session[:access_token] = nil
    redirect_to root_url
  end
end
