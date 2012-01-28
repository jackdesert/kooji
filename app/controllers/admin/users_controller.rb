class Admin::UsersController < ApplicationController

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
    debugger
    
  end

  def search

  end


end
