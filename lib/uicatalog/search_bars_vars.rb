class SearchBarsVars
  include SharedFunctions

  def initialize
    @search_bars    = $driver.find_element(:name => 'Search Bars')
    @default        = $driver.find_element(:name => 'Default')
    @custom         = $driver.find_element(:name => 'Custom')

    create_getters
  end
end