class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def index

  end

  def current_user
    current_user = User.find(session[:current_user_id])
    puts current_user
    return current_user
  end

  def is_user_logged_in?
	#complete this method


  	logged_in = current_user
	if logged_in.nil? then redirect_to root_path else true end
  end
end
