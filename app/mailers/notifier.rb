
class Notifier < ActionMailer::Base
  default :from => "regi@hbbostonamc.org"



  # send a signup email to the user, pass in the user object that contains the user's email address
  def reg_status_email(user)

    mail( :to => user.email,
          :subject => "Registration Status Update for XXX" )
  end

  def password_reset_instructions(user)
    @reset_link = edit_password_reset_url(user.perishable_token, :host => "localhost")
    mail( :to => user.email,
          :subject => "Password Reset Instructions")
  end


end
