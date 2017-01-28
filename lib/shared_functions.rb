module SharedFunctions
  include RandomToken

  def create_getters
    instance_variables.each do |v|
      define_singleton_method(v.to_s.tr('@','')) do
        instance_variable_get(v)
      end
    end
  end

  def get_email
    username = RandomToken.gen(15)
    email = username + '@mailinator.com'
  end
end