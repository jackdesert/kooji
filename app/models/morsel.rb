class Morsel < ActiveRecord::Base

  belongs_to :user
  belongs_to :event

  def phrase(user)
    text = self.text
    name = self.user.full_name
    if ['leader', 'coleader', 'registrar'].include? text
      my_phrase = 'You were made ' + text + " for "
      phrase = name + ' was made ' + text + " for "
    elsif text == 'approved' || text == 'waitlisted'
      my_phrase = 'You were ' + text + ' for '
      phrase = name + ' was ' + text + ' for '
    elsif text == 'canceled'
      my_phrase = 'You were canceled from '
      phrase = name + ' was canceled from '
    elsif text == 'submitted'
      my_phrase = 'You signed up for '
      phrase = name + ' signed up for '
    end
    if self.user == user
      return my_phrase 
    else
      return phrase 
    end
  end
end
