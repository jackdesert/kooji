
class Notifier < ActionMailer::Base
  default :from => "regi@hbbostonamc.org"

  # send a signup email to the user, pass in the user object that contains the user's email address
  def reg_status_email(user)
    mail( :to => user.email,
          :subject => "Registration Status Update for XXX" )
  end

  def password_reset_instructions(user)
    subject       "Password Reset Instructions"
    from          "Binary Logic Notifier "
    recipients    user.email
    sent_on       Time.now
    body          :edit_password_reset_url => edit_password_reset_url(user.perishable_token)
  end


end
