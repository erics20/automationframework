When(/I search for "([^"]*)"$/) do |search|
  on(WebFunctions) do |page|
    page.search_google(search)
  end
end

Then(/I should see "([^"]*)"$/) do |item|

end