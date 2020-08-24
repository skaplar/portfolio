class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    respond_to do |format|
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        format.html { redirect_to root_url, notice: "Logged in!" }
      else
        format.html { redirect_to :login, alert: "Email or password is invalid" }
      end
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out!"
  end
end
