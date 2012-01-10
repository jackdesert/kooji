class ApplicationController < ActionController::Base

  helper_method :current_user_session, :current_user
  before_filter :may_create_events_no_redirect
  before_filter :load_yaml
require 'yaml'
  protected


  def current_user_session
    @current_user_session ||= UserSession.find
  end

  def current_user
    @current_user ||= current_user_session && current_user_session.user
  end

  def authenticate
    unless current_user
      flash[:notice] = "You're not logged in, Captain"
      binding.pry
      where_to = @_env["REQUEST_PATH"].nil? ? @_env["PATH_INFO"] : @_env["REQUEST_PATH"] 
      extra_param = "?send_to=" + where_to
      
      send_here = new_user_session_path + extra_param
      redirect_to send_here
      return false
    end
    return current_user.id
  end

  def require_no_user
    if current_user
      flash[:error] = "It appears that you are already logged in. Please log out before completing that action"
      redirect_to root_path
    end
  end

  def may_edit_event
    if current_user
      return true if is_admin
      my_reg = Registration.where(:user_id => current_user.id, :event_id => params[:id]).first
      unless my_reg.nil?
        if [:leader, :coleader, :registrar].include? my_reg.register_status.downcase.to_sym
          return true
        elsif my_reg.event.registrar == current_user
          return true
        end
      end
    end
    flash[:error] = "You must be the leader, the coleader, or the registrar of this event to edit the event details"
    redirect_to event_path(params[:id])
    return false
  end

  def is_admin
    return false unless current_user
    if [:admin].include? current_user.user_type.downcase.to_sym
      return true
    else
      return false
    end
  end


  def may_create_events
    unless current_user.user_type.nil?
      return true if may_create_events_no_redirect
    end
    flash[:notice] = "I'm sorry, only leaders, coleaders, and admins can create trips"
    redirect_to "/"
    return false
  end

  def may_create_events_no_redirect
    if current_user
     @show_create_event_link = true #[:leader, :coleader, :admin].include? current_user.user_type.downcase.to_sym
      return @show_create_event_link
    else
      return false
    end
  end

  def load_yaml
    #@string = YAML::load(ERB.new(IO.read(File.join(Rails.root, 'config', 'strings.yml'))).result)[RAILS_ENV]
    @string = YAML::load(File.open("#{Rails.root}/config/strings.yml"))
  end

  protect_from_forgery
end
