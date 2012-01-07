Given /^the following (\S+) exists?:$/ do |model, table|
  table.hashes.each do |hash|
    Factory(model.singularize, hash)
  end
end  
