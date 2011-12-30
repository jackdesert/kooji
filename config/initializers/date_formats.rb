class Date

  def pretty
    # Outputs date format as "Tue 12/24/09"
    self.strftime("%a %m/%d/%y")
  end

  def short
    # Outputs date format as "12/24/09"
    self.strftime("%m/%d/%y")
  end
end
