module SharedFunctions

  def create_getters
    instance_variables.each do |v|
      define_singleton_method(v.to_s.tr('@','')) do
        instance_variable_get(v)
      end
    end
  end

  def useful_initialize_error
      instance_variables.each do |v|
        begin
          define_singleton_method(v.to_s.tr('@','')) do
            instance_variable_get(v)
          end
        rescue
          "Can't find #{v} on page"
        end
      end
  end

end