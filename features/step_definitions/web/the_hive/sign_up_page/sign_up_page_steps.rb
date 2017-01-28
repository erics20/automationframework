include SharedFunctions

When(/I sign up a user$/) do
  sup = SignUpPageVars.new
  sup.first_name.send_keys Faker::Name.first_name
  sup.last_name.send_keys Faker::Name.last_name
  sup.phone_number.send_keys Faker::PhoneNumber.phone_number
  sup.email.send_keys get_email
end