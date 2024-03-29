class PasswordResetsController < ApplicationController
  before_filter :require_no_user  # If you attempt to reset your password while you are logged in, your perishable token will change before you can use it
  before_filter :load_user_using_perishable_token, :only => [:edit, :update]


  def new
    render
  end

  def create
    @user = User.find_by_email(params[:email])
    if @user
      @user.deliver_password_reset_instructions!
      flash[:notice] = "Instructions to reset your password have been emailed to you. " +
      "Please check your email."
      redirect_to new_password_reset_path
    else
      flash[:notice] = "No user was found with that email address"
      render :action => :new
    end
  end


  def edit
    @token = params[:token]
    render
  end

  def update
    @user.password = params[:user][:password]
    @user.password_confirmation = params[:user][:password_confirmation]
    if @user.save
      flash[:notice] = "Password successfully updated"
      redirect_to root_url
    else
      render :action => :edit
    end
  end

  private
  def load_user_using_perishable_token

    @user = User.find_using_perishable_token(params[:token])
    unless @user
      flash[:notice] = "We're sorry, but we could not locate your account. " +
      "If you are having issues try copying and pasting the URL " +
      "from your email into your browser or restarting the " +
      "reset password process."
      redirect_to root_url
    end
  end


end  
