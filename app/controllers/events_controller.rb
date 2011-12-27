class EventsController < ApplicationController
  before_filter :may_create_events, :only => [:new, :create]
  before_filter :may_edit_event, :only => [:edit, :update]
  # GET /events
  # GET /events.json
  def index
    @events = Event.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @events }
    end
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @event = Event.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/new
  # GET /events/new.json
  def new
    @event = Event.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(params[:event])

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render json: @event, status: :created, location: @event }
      else
        format.html { render action: "new" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /events/1
  # PUT /events/1.json
  def update
    @event = Event.find(params[:id])

    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def roster
    @event = Event.find(params[:id])
    @registration = Registration.first
  end


  def export
    headers['Content-Type'] = "application/vnd.ms-excel"
    headers['Content-Disposition'] = 'attachment; filename="report.xls"'
    headers['Cache-Control'] = ''
    @registrations = Registration.where(:event_id => params[:id])
  end


  def may_create_events
    unless current_user.user_type.nil?
      if [:leader, :coleader, :admin].include? current_user.user_type.downcase.to_sym
        return true
      end
    end
    flash[:notice] = "I'm sorry, only leaders, coleaders, and admins can create trips"
    redirect_to "/"
    return false
  end

  def may_edit_event
    my_reg = Registration.where(:user_id => current_user.id, :event_id => params[:id])
    unless my_reg.empty?
      if [:leader, :coleader, :registrar].include? my_reg.register_status.downcase.to_sym
        return true
      end
    end
    flash[:notice] = "You must be the leader, the coleader, or the registrar of this event to edit the event details"
    redirect_to event_path
    return false
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to events_url }
      format.json { head :ok }
    end
  end
end
