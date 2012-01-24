class UsersController < ApplicationController
  before_filter :authenticate, :except => [:create, :new]
  before_filter :require_no_user, :only =>[:create, :new]
  # GET /users
  # GET /users.json
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(current_user.id)
    @tab_active_profile = :active

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(current_user.id)
    @tab_active_profile = :active
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])
    @user.user_type = 'user'

    respond_to do |format|
      if @user.save
        format.html { redirect_to root_path, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(current_user.id)
    if @user.email == "demo@sunni.ru"
      flash[:error] = "Demo User is not allowed to update her profile"
      redirect_to user_path and return
    end
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to user_path, notice: 'User was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :ok }
    end
  end
end
