When(/I click on the Calculator "([^"]*)" button$/) do |button|
  cal = CalculatorVars.new
  case button
    when "1"
      GenericEmulator.new.click(cal.digit1)
    when "2"
      GenericEmulator.new.click(cal.digit2)
    when "3"
      GenericEmulator.new.click(cal.digit3)
    when "4"
      GenericEmulator.new.click(cal.digit4)
    when "5"
      GenericEmulator.new.click(cal.digit5)
    when "add"
      GenericEmulator.new.click(cal.plus)
    when "subtract"
      GenericEmulator.new.click(cal.subtract)
    when "equal"
      GenericEmulator.new.click(cal.equal)
  end
end

Then(/I should have the answer to "([^"]*)" plus "([^"]*)"$/) do |num1, num2|
  cal = CalculatorVars.new
  answer1 = GenericEmulator.new.get_element_text(cal.answer)
  answer2 = num1.to_i + num2.to_i
  fail "The answers were not equal '#{answer1}' and '#{answer2}'" unless answer1.to_i.equal? answer2.to_i
end

Then(/I should have the answer to "([^"]*)" minus "([^"]*)"$/) do |num1, num2|
  cal = CalculatorVars.new
  answer1 = GenericEmulator.new.get_element_text(cal.answer)
  answer2 = num1.to_i - num2.to_i
  fail "The answers were not equal '#{answer1}' and '#{answer2}'" unless answer1.to_i.equal? answer2.to_i
end