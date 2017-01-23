When(/I click on the Search Bars "([^"]*)" button$/) do |button|
  sb = SearchBarsVars.new
  case button
    when 'Default'
      GenericEmulator.new.click(sb.default)
    when 'Custom'
      GenericEmulator.new.click(sb.custom)
  end
end