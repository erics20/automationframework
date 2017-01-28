#Cucumber provides a number of hooks which allow us to run blocks at various points in the Cucumber test cycle

Before do
  # Do something before each scenario.
end

Before do |scenario|
  # The +scenario+ argument is optional, but if you use it, you can get the title,
  # description, or name (title + description) of the scenario that is about to be
  # executed.
end

After do

end

After do |scenario|
  # Do something after each scenario.
  # The +scenario+ argument is optional, but
  # if you use it, you can inspect status with
  # the #failed?, #passed? and #exception methods.

  if(scenario.failed?)
    #Do something if scenario fails.
  end
end

#Tagged hooks

Before('@android, @iOS') do

end

Before('@android, ~@iOS') do
  system ''
end

AfterStep('@Ex_tag1, @Ex_tag2') do
  # This will only run after steps within scenarios tagged
  # with @cucumis AND @sativus.
end

at_exit do
  # Kill appium
  $driver.quit

  if `ps -A | grep -m1 appium | awk '{print $1}'`
    system "kill -9 `ps -A | grep -m1 appium | awk '{print $1}'`"
  end
  # Kill simulators or drivers
  case $platform
    when "android"
      system 'adb -e emu kill'
    when "iOS"
      count = `xcrun simctl list | grep Booted | wc -l | sed -e 's/ //g'`.to_i
      if count > 0
        system "kill `ps -A | grep -m1 '#{$path_to_sim}'  | awk '{print $1}'`"
        system "xcrun simctl shutdown all"
        sleep(5)
      end
  end
end
