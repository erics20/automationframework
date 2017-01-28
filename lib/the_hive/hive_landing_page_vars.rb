class HiveLandingPage
  include SharedFunctions

  def initialize
    @sign_up  = $driver.find_elements(:css, 'a[ng-link="header.linkToCustomer"]')[1]

    create_getters
  end
end