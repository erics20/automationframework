Given(/I am on home page of the "([^"]*)"$/) do |url|
  case url
    when "The Hive"
      $driver.get "https://stage-www.thehive.market/landing"
  end
end

