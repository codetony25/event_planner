class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  def current_user
  	User.find(session[:user_id]) if session[:user_id] != nil
  end

  def event_page
  	return "/events"
  end

  def current_page
  	current_uri = request.env['PATH_INFO']
  end

  helper_method :current_user
  helper_method :current_page
  helper_method :event_page
end
