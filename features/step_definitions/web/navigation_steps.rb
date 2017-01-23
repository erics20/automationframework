Given(/I am on "([^"]*)"$/) do |url|
  puts $driver
  $driver.get url
end

