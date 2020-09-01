class ApplicationController < ActionController::Base
  helper_method :current_user, :first_user

  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    else
      @current_user = nil
    end
  end

  def first_user
    !User.exists?
  end

  def logged_in
    unless session[:user_id]
      redirect_to :login
    end
  end

end
