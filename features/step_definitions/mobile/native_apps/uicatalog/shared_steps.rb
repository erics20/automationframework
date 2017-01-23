Given(/I am on the home page of the "([^"]*)" app$/) do |app|
  hp = HomePageVars.new
  case app
    when 'UICatalog'
      GenericEmulator.new.element_enabled(hp.action_sheets)
  end
end

When(/I click on the UICatalog "([^"]*)" button$/) do |button|
  hp = HomePageVars.new
  case button
    when "Search Bars"
      GenericEmulator.new.scroll_and_click(hp.search_bars, 'down')
    when "Default"

  end
end

