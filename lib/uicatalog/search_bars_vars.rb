class SearchBarsVars

  def initialize
    @search_bars    = $driver.find_element(:name => 'Search Bars')
    @default        = $driver.find_element(:name => 'Default')
    @custom         = $driver.find_element(:name => 'Custom')

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