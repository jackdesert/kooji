class UserSessionsController < ApplicationController

  def new
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      
      if params[:send_to]
        redirect_to params[:send_to] and return
      end
      redirect_to root_path
    else
    	flash[:error] = "Password Incorrect"
      render :action => :new
    end
  end

  def destroy
    current_user_session.destroy
    flash[:notice] = "You have successfully logged out. Please come again."
    redirect_to new_user_session_path
  end

end
