Given /^the following (\S+) exists?:$/ do |table, model|
  table.hashes.each do |hash|
    Factory(:user, hash)
  end
end  
