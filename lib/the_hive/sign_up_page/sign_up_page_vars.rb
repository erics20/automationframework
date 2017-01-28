class SignUpPageVars
  include SharedFunctions

  def initialize
    @first_name   = $driver.find_element(:css => 'input[ng-model="customerSignup.user.profile.contact.firstName"]')
    @last_name    = $driver.find_element(:css => 'input[ng-model="customerSignup.user.profile.contact.lastName"]')
    @phone_number = $driver.find_element(:css => 'input[ng-model="customerSignup.user.profile.contact.phoneNumber"]')
    @email        = $driver.find_element(:css => 'input[ng-model="customerSignup.user.username"]')

    create_getters
  end
end