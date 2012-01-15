class String

  def single_space
    self.gsub('  ', ' ')
  end
  def wrap
    "(" + self + ")"
  end

  def pretty_phone
    return nil if self.nil?
    if self.length == 10
      first = self[0,3]
      second = self[3,3]
      third = self[6,4]
      pretty = "(" + first + ")" + " " + second + "-" + third
    else
      pretty = "unknown format"
    end
    pretty
  end
end
