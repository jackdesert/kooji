class Object
  def p
    # An easy way to see the methods in any object
    print self.methods.sort.to_yaml
  end

end
