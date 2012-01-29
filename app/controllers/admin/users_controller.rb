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
    respond_to do |format|
      if user.save
        format.html {redirect_to admin_users_path}
        format.js {render :layout => false}# this means the <name>.js.erb file will be called
      else
        format.html {redirect_to admin_users_path, :error => "User type #{user.errors.messages[:user_type].first}. Unable to update user."}
        format.js # How do I display an error if I end up here?
      end
    end
  end

  def search

  end


end
