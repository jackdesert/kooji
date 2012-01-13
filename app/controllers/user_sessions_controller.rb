class UserSessionsController < ApplicationController

  def new
    @user_session = UserSession.new
  end

  def create
    in_email = params[:user_session][:email]
    @user_session = UserSession.new(params[:user_session])
    unless valid_email_address(in_email)
      flash[:error] = "#{in_email} does not look like a real email address."
      render :action => :new and return
    end
    if @user_session.save
      redirect_back root_path
    else
      if  @user_session.errors.messages[:email]
        flash[:error] = "Error: #{in_email} was not found in our system. Please check your email address and try again"
    	elsif @user_session.errors.messages[:password]
      	flash[:error] = "Yes, your email address (#{in_emai} is in our system. But you typed the wrong password"
      end
      render :action => :new
    end
  end

  def destroy
    current_user_session.destroy
    flash[:notice] = "You have successfully logged out. Please come again."
    redirect_to new_user_session_path
  end
  
  def valid_email_address(input)
    return true if input.downcase =~ /[a-z0-9_.]+@[a-z0-9_.]+\.[a-z]{2,4}/
    return false
  end
end
