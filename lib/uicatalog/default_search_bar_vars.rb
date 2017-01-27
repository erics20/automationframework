class DefaultSearchBarVars
  include SharedFunctions

  def initialize
    @scope_one    = $driver.find_element(:name => 'Scope One')
    @scope_two    = $driver.find_element(:name => 'Scope Two')
    @search_bar   = $driver.find_element(:class_name => 'XCUIElementTypeSearchField')

    create_getters
  end
end