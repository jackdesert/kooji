class Admin::UsersController < ApplicationController

  before_filter :redirect_unless_admin
  
  def show
    @users = User.where(:id => params[:id])
  end

  def index
    admins =   User.where(:user_type => "admin")
    creators = User.where(:user_type => "creator")
    @users = admins + creators
  end

  def index_prospectives
    @users = User.where(:leader_request => true)
  end

  def update
    user = User.find(params[:id])
    new_user_type = params[:commit].downcase
    user.user_type = new_user_type
    unless user.save
      flash[:error] = "User type #{user.errors.messages[:user_type].first}. Unable to update user."
    end
    redirect_to admin_users_path
  end

  def search

  end


end
