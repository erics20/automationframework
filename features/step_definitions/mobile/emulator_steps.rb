require 'selenium-cucumber'

Given(/I have opened the "([^"]*)" emulator$/) do |emulator|
  RunEmulators.new.wait_for_emulator(emulator)
end

Given(/I am on the Calculator app$/) do
  RunEmulators.new.check_element_enable('id', 'com.android.calculator2:id/display', true)
end

Given(/I am on the UICatalog app$/) do
  RunEmulators.new.check_element_enable('name', 'Search Bars', true)
end

When(/I have opened the android app "([^"]*)"$/) do |apk|

end

Then(/I click on element having id "(.*?)"$/) do

end

When(/I click on the "([^"]*)" button$/) do |button|

  case button
    when '1'
      RunEmulators.new.click("id", "com.android.calculator2:id/digit1")
    when '2'
      RunEmulators.new.click("id", "com.android.calculator2:id/digit2")
    when "3"
      RunEmulators.new.click("id", "com.android.calculator2:id/digit3")
    when "4"
      RunEmulators.new.click("id", "com.android.calculator2:id/digit4")
    when "5"
      RunEmulators.new.click("id", "com.android.calculator2:id/digit5")
    when "add"
      RunEmulators.new.click("id", "com.android.calculator2:id/plus")
    when "equal"
      RunEmulators.new.click("id", "com.android.calculator2:id/equal")
    when "Search Bars"
      RunEmulators.new.click('name', 'Action Sheets')
  end
end

Then(/I should have the answer to "([^"]*)" plus "([^"]*)"$/) do |num1, num2|
  answer1 = RunEmulators.new.get_element_text('class', 'android.widget.EditText')
  answer2 = num1.to_i + num2.to_i
  fail "The answers were not equal '#{answer1}' and '#{answer2}'" unless answer1.to_i.equal? answer2.to_i
end
