class Admin::UsersController < ApplicationController

  def show
    @users = User.where(:id => params[:id])
  end


  def index_prospectives
    @users = User.where(:id => params[:id])
  end


end
