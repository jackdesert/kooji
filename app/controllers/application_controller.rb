class ApplicationController < ActionController::Base
  helper_method :current_user_session, :current_user

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
      redirect_to new_user_session_path
      return false
    end
    return current_user.id
  end


  def may_edit_event
    return true if is_admin
    my_reg = Registration.where(:user_id => current_user.id, :event_id => params[:id]).first
    unless my_reg.nil?
      if [:leader, :coleader, :registrar].include? my_reg.register_status.downcase.to_sym
        return true
      end
    end
    flash[:notice] = "You must be the leader, the coleader, or the registrar of this event to edit the event details"
    redirect_to event_path
    return false
  end

  def is_admin
    if [:admin].include? current_user.user_type.downcase.to_sym
      return true
    else
      return false
    end
  end


  protect_from_forgery
end
