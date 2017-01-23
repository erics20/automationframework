When(/I click on the Default Search Bar "([^"]*)" text field$/) do |button|
  default = DefaultSearchBarVars.new
  case button
    when "Scope One"
      GenericEmulator.new.click(default.scope_one)
    when "Scope Two"
      GenericEmulator.new.click(default.scope_two)
  end
end

Then(/I should be able to type "([^"]*)" into the search bar$/) do |text|
  default = DefaultSearchBarVars.new
  GenericEmulator.new.send_keys(default.search_bar, text)
end

