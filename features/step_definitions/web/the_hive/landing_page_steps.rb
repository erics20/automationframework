When(/I click on the "([^"]*)" page$/) do |button|
  case button
    when "Sign up"
      hlp = HiveLandingPage.new
      GenericEmulator.new.click(hlp.sign_up)
  end
end