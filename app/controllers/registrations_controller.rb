class RegistrationsController < ApplicationController
  before_filter :authenticate
  before_filter :may_edit_event, :only => :update_register_status
  before_filter :get_current_registration, :only => [:show, :update, :edit]


  def get_current_registration
    Registration.where(:event_id => params[:event_id], :user_id => current_user.id).first
  end


  def show
    @registration = get_current_registration
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @registration }
    end
  end

  def new
    @registration = Registration.new
    @registration.event_id = params[:event_id]
    @sign_up = true
    respond_to do |format|
      format.html #{ redirect_to event_path(params[:id]) and return}
      format.json { render json: @registration }
    end
  end

  def edit
    @registration = get_current_registration
  end

  def create
    @registration = Registration.new(params[:registration])
    @registration.user_id = current_user.id
    respond_to do |format|
      if @registration.save
        morsel = Morsel.new(:user_id => current_user, :text => "signed up for", 
                            :event_id => @registration.event.id)
        morsel.save
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
      @morsels = current_user.morsels
      @future = []
      @past = []
      registrations = Registration.where(:user_id => current_user.id)
      registrations.each do |reg|
        if reg.event.future?
          @future << reg
        else
          @past << reg
        end
      end

      if @past.empty? && @future.empty?
        @has_registrations = false
      else
        @has_registrations = true
      end
    end
  end


  def update
    @registration = get_current_registration

    respond_to do |format|
      if @registration.update_attributes(params[:registration])
        morsel = Morsel.new(:user_id => current_user, :text => "updated registration answers for", 
                            :event_id => @registration.event.id)
        morsel.save
        
        
        format.html { redirect_to event_path(@registration.event.id), notice: 'Registration was successfully updated.' }
        format.json { head :ok }
      else

        session[:registration] = @registration
        format.html { render :controller => :events, :action => :show }
        format.json { render json: @registration.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_register_status
    debugger
      a = Registration.where(:user_id => params[:user_id], :event_id => params[:id]).first
      @new_status = params[:commit]
      a.register_status = @new_status.downcase
      a.save
      Notifier.reg_status_email(a.user, a.event, a.register_status).deliver
      morsel = Morsel.new(:user_id => a.user_id, :text => "#{@new_status} for", 
                          :event_id => a.event_id)
      morsel.save
      
    respond_to do |format|
      format.html {redirect_to roster_path(:id => params[:id])}
      format.js
    end

  end

end
