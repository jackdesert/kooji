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

  def may_create_trips(user)
    if [:leader, :coleader, :admin].include? user.user_type.downcase.to_sym
      return true
    else
      return false
    end
  end

  protect_from_forgery
end
