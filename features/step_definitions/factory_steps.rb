Given /^the following user exists:$/ do |table|
  table.hashes.each do |hash|
debugger
    Factory(:user, hash)
  end
end  
