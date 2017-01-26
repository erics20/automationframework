Given(/I am on the home page of the "([^"]*)" app$/) do |app|
  case app
    when 'UICatalog'
      hp = UICatalogHomePageVars.new
      GenericEmulator.new.element_enabled(hp.action_sheets)
  end
end

When(/I click on the UICatalog "([^"]*)" button$/) do |button|
  case button
    when "Search Bars"
      hp = UICatalogHomePageVars.new
      GenericEmulator.new.scroll_and_click(hp.search_bars, 'down')
    when "Default"

  end
end

