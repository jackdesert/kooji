class EventsController < ApplicationController
  before_filter :capture_original_request, :only => [:roster, :edit, :show]
  before_filter :may_create_events, :only => [:new, :create]
  before_filter :may_edit_event, :only => [:edit, :update, :roster, :export]
  before_filter :authenticate
  before_filter :set_show_admin_tabs
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
    @leadership_team = @event.leaders + @event.coleaders
    @leadership_team << @event.registrar unless @leadership_team.include? @event.registrar
    @registration = Registration.where(:user_id => current_user.id, :event_id => @event.id).first

    if @registration.nil?
      @new_registration = Registration.new
      @new_registration.event = @event
      @new_registration.user = current_user
    end
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
    @event.registrar = current_user

    respond_to do |format|
      if @event.save
        leader_reg = Registration.new(:user_id => current_user.id, :event_id => @event.id, :register_status => :leader)
        leader_reg.save
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
    if params[:anchor]
      redirect_to roster_path(:id => params[:id]) + "#" + params[:anchor]
    end
    @event = Event.find(params[:id])
    @registrations = Registration.where(:event_id => @event.id).sort do |a, b|
      a.sorted_by_status <=> b.sorted_by_status
    end
    @approved_participants = Registration.return_approved_users(@registrations)
  end

  def carpooling
    @event = Event.find(params[:id])
    @registrations = Registration.where(:event_id => @event.id).sort do |a, b|
      a.user.first_name <=> b.user.first_name
    end
    @approved_registrations = Registration.return_approved_registrations(@registrations)
    @can_takes  = @approved_registrations.array_where(:carpooling => "can take" )
    @need_rides = @approved_registrations.array_where(:carpooling => "need ride")
    @all_sets   = @approved_registrations.array_where(:carpooling => "all set"  )
  end

  def export
    headers['Content-Type'] = "application/vnd.ms-excel"
    headers['Content-Disposition'] = 'attachment; filename="report.xls"'
    headers['Cache-Control'] = ''
    @registrations = Registration.where(:event_id => params[:id])
  end

  def get_the_word_out
    @event = Event.find(params[:id])
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
  def set_show_admin_tabs
    @show_admin_tabs = show_admin_tabs?
  end
end
