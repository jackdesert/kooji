class RegistrationsController < ApplicationController
  before_filter :authenticate
  before_filter :may_edit_event, :only => :update_register_status
  # GET /registrations
  # GET /registrations.json
  def index
    @registrations = Registration.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @registrations }
    end
  end

  # GET /registrations/1
  # GET /registrations/1.json
  def show
    @registration = Registration.find(1)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @registration }
    end
  end

  # GET /registrations/new
  # GET /registrations/new.json
  def new
    @registration = Registration.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @registration }
    end
  end

  # GET /registrations/1/edit
  def edit
    @registration = Registration.find(params[:id])
  end

  # POST /registrations
  # POST /registrations.json
  def create
    @registration = Registration.new(params[:registration])
    @registration.user_id = current_user.id
debugger
    respond_to do |format|
      if @registration.save
        Notifier.reg_status_email(current_user, @registration.event, :submitted).deliver
        Notifier.tell_leaders_about_new_registrant(current_user, @registration.event).deliver
        format.html { redirect_to @registration, notice: 'Registration was successfully created.' }
        format.json { render json: @registration, status: :created, location: @registration }
      else
        format.html { render action: "new" }
        format.json { render json: @registration.errors, status: :unprocessable_entity }
      end
    end
  end


  def mine
    # I have no idea why we end up here when we reset a password
    if current_user
      @my_registrations = Registration.where(:user_id => current_user.id)
    else
      @my_registrations = []
    end
end


  # PUT /registrations/1
  # PUT /registrations/1.json
  def update
    @registration = Registration.find(params[:id])

    respond_to do |format|
      if @registration.update_attributes(params[:registration])
        format.html { redirect_to @registration, notice: 'Registration was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @registration.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_register_status
      a = Registration.where(:user_id => params[:user_id], :event_id => params[:event_id]).first
      a.register_status = params[:commit]
      @new_status = params[:new_status]
      a.save
      Notifier.reg_status_email(a.user, a.event, a.register_status).deliver

    respond_to do |format|
      format.html {redirect_to roster_path(:id => params[:event_id])}
      format.js
    end

  end


  # DELETE /registrations/1
  # DELETE /registrations/1.json
  def destroy
    @registration = Registration.find(params[:id])
    @registration.destroy

    respond_to do |format|
      format.html { redirect_to registrations_url }
      format.json { head :ok }
    end
  end
end
