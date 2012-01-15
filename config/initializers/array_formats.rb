class Array
  def array_where(hash)
    # assumes an array of active record objects
    # assumes the attribute you are querying is either string or text
    output = []
    key = hash.keys.first
    value = hash[key]
    self.each do |a|
      attribute = eval("a.#{key.to_s}")
      output << a if attribute == value.to_s
    end
    output
  end
end
