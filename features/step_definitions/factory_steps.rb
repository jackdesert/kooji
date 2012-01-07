Given /^the following users? exists?:$/ do |table|
  table.hashes.each do |hash|
    Factory(:user, hash)
  end
end  
