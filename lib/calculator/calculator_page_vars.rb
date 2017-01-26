class CalculatorVars
  include SharedFunctions

  def initialize
    @digit1   = $driver.find_element(:id => 'com.android.calculator2:id/digit1')
    @digit2   = $driver.find_element(:id => 'com.android.calculator2:id/digit2')
    @digit3   = $driver.find_element(:id => 'com.android.calculator2:id/digit3')
    @digit4   = $driver.find_element(:id => 'com.android.calculator2:id/digit4')
    @digit5   = $driver.find_element(:id => 'com.android.calculator2:id/digit5')
    @plus     = $driver.find_element(:id => 'com.android.calculator2:id/plus')
    @subtract = $driver.find_element(:id => 'com.android.calculator2:id/minus')
    @equal    = $driver.find_element(:id => 'com.android.calculator2:id/equal')
    @answer   = $driver.find_element(:class => 'android.widget.EditText')

    create_getters
  end
end