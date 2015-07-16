class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?

  def current_user
    unless @checked
      @current_user ||= User.find_by(session_token: session[:session_token])
      @checked = true
    end

    @current_user
  end

  def logged_in?
    session[:session_token] != nil
  end

  def log_in_user!(user)
    user.reset_session_token!
    session[:session_token] = user.session_token
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end

  def redirect_if_logged_in
    redirect_to user_url(current_user) if current_user
  end

  def require_login
    redirect_to new_session_url unless logged_in?
  end

end
