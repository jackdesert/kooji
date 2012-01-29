class Morsel < ActiveRecord::Base

  belongs_to :user
  belongs_to :event
  validates_format_of :text, :with => /^(leader)?(coleader)?(registrar)?(approved)?(waitlisted)?(updated)?$/

  def phrase(user)
    text = self.text
    name = self.user.full_name
    if ['leader', 'coleader', 'registrar'].include? text
      my_phrase = 'You became ' + text + " of"
      phrase = name + ' became ' + text + " of"
    elsif text == 'approved' || text == 'waitlisted'
      my_phrase = 'You were ' + text + ' for'
      phrase = name + ' was ' + text + ' for'
    elsif text == 'canceled'
      my_phrase = 'You were canceled from'
      phrase = name + ' was canceled from'
    elsif text == 'submitted'
      my_phrase = 'You signed up for'
      phrase = name + ' signed up for'
    elsif text == 'updated'
      my_phrase = 'You updated your registration for'
      phrase = name + ' updated their registration for'
    end
    if self.user == user
      return my_phrase 
    else
      return phrase 
    end
  end
end
