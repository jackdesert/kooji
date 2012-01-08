class String

  def single_space
    self.gsub('  ', ' ')
  end
  def wrap
    "(" + self + ")"
  end

end
