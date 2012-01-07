
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
          :subject => "Registration Status Update for #{@event.event_name}" )
  end

  def tell_leaders_about_new_registrant(user, event)
    @user = user
    @event = event
    @roster_url = roster_url(event.id, :host => get_host)
    mail( :to => get_leaders_emails(event),
          :subject => "New Registrant for #{@event.event_name}",
          :reply_to => @user.email )
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

  def get_leaders_emails(event)
    emails = []
    registrar = User.where(:id => event.registrar_id)
    registrar_reg = Registrations.where(:event => event, :user => registrar)
    leader_regs = Registrations.where(:event => event, :register_status => :leader)
    coleader_regs = Registrations.where(:event => event, :register_status => :coleader)
    all_registrations = registrar_reg + leader_regs + coleader_regs
    all_registrations.uniq!
    all_registrations.each do |reg|
      emails << reg.user.email
    end
    return emails
  end

end
