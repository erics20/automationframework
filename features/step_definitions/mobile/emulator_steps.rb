# require 'selenium-cucumber'
#
# When(/I click on the "([^"]*)" button$/) do |button|
#
#   case button
#     when '1'
#       RunEmulators.new.click("id", "com.android.calculator2:id/digit1")
#     when '2'
#       RunEmulators.new.click("id", "com.android.calculator2:id/digit2")
#     when "3"
#       RunEmulators.new.click("id", "com.android.calculator2:id/digit3")
#     when "4"
#       RunEmulators.new.click("id", "com.android.calculator2:id/digit4")
#     when "5"
#       RunEmulators.new.click("id", "com.android.calculator2:id/digit5")
#     when "add"
#       RunEmulators.new.click("id", "com.android.calculator2:id/plus")
#     when "equal"
#       RunEmulators.new.click("id", "com.android.calculator2:id/equal")
#     when "Search Bars"
#       RunEmulators.new.click('name', 'Action Sheets')
#   end
# end

# Then(/I should have the answer to "([^"]*)" plus "([^"]*)"$/) do |num1, num2|
#   answer1 = RunEmulators.new.get_element_text('class', 'android.widget.EditText')
#   answer2 = num1.to_i + num2.to_i
#   fail "The answers were not equal '#{answer1}' and '#{answer2}'" unless answer1.to_i.equal? answer2.to_i
# # end
