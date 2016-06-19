module SessionsHelper

  ## this is where we will place our helper methods for our sessions controller ##
  def login(user)
    session[:user_id] = user.idea
    @current_user = user
  end

  def current_user
    @current_user ||= User.find(session[:user_id])
  end

  def logged_in?
    if @current_user == nil
      redirect_to "/login"
    end
  end

  def logout
    @current_user = session[:user_id] = nil
  end

end
