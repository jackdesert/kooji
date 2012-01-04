
class Notifier < ActionMailer::Base
  default :from => "regi@hbbostonamc.org"



  # send a signup email to the user, pass in the user object that contains the user's email address
  def reg_status_email(user, event, new_status)
    @user = user
    @event = event
    @new_status = new_status
    @event_link = event_url(event.id, :host => get_host)
    @support_url = support_url(:host => get_host)
    mail( :to => user.email,
          :subject => "Registration Status Update for XXX" )
  end

  def password_reset_instructions(user)
    @reset_link = edit_password_reset_url(user.perishable_token, :host => get_host)
    mail( :to => user.email,
          :subject => "Password Reset Instructions")
  end

  def get_host
    if Rails.env.to_sym == :development
      return "localhost"
    else
      return "http://hbbostonamc.org/regi"
    end
  end

end
