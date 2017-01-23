class DefaultSearchBarVars

  def initialize
    @scope_one    = $driver.find_element(:name => 'Scope One')
    @scope_two    = $driver.find_element(:name => 'Scope Two')
    @search_bar   = $driver.find_element(:name => 'Default Search Bar')

    create_getters
  end

  def create_getters
    instance_variables.each do |v|
      define_singleton_method(v.to_s.tr('@','')) do
        instance_variable_get(v)
      end
    end
  end
end