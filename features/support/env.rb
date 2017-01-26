$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '../../','lib'))

require 'rubygems'

require 'selenium-cucumber'
require 'require_all'
require 'fire_poll'
require 'page-object'
require 'page-object/elements'
require 'page-object/page_factory'
require 'active_support/all'
require 'rspec'
require 'selenium-webdriver'
require 'nokogiri'

require_all 'lib'

$browser_type = ENV['BROWSER'] || 'chrome'
$platform = ENV['PLATFORM']
$os_version = ENV['OS_VERSION']
$device_name = ENV['DEVICE_NAME']
$app_path = ENV['APP_PATH']
$automationName = ENV['AUTOMATION_NAME']

$iOSudid = ENV['iOSUDID'] || 'DE69323E-19A4-4D82-85C5-81E728A782C0' #iPhone SE
if $platform == 'iOS'
  $udid = ENV['UDID'] || $iOSudid
end

#iOS command line launch ENVs
$path_to_sim = ENV['PATH_TO_SIM'] || '/Applications/Xcode.app/Contents/Developer/Applications/Simulator.app/Contents/MacOS/Simulator'

$emulator_name = ENV['EMULATOR']

# # check for valid parameters
# validate_parameters $platform, $browser_type, $app_path
puts "Setting up automation environment..."

#Add "device name" inside of the android command line
if $platform == 'android'
  if `adb shell getprop init.svc.bootanim 2>&1&`.strip == 'stopped'
    system 'adb -e emu kill'
  end
  system 'nohup emulator -avd GalaxyNexus19 > features/debug/android_logs/$(date +%Y%m%d-%H%M).txt 2>&1&'
  sleep(10)
       FirePoll.poll("waited too long", 80) do
         emulator_on = `adb shell getprop init.svc.bootanim 2>&1&`.strip #`adb shell getprop init.svc.bootanim > features/debug/android_logs/load_emulator/$(date +%Y%m%d-%H%M).txt 2>&1&`.strip
         if emulator_on == "stopped"
           true
         end
       end
end

if $platform == 'iOS'
  count = `xcrun simctl list | grep Booted | wc -l | sed -e 's/ //g'`.to_i
  if count > 0
    system "kill `ps -A | grep -m1 '#{$path_to_sim}'  | awk '{print $1}'`"
    sleep(5)
  end
  system "nohup '#{$path_to_sim}' -CurrentDeviceUDID '#{$iOSudid}' > features/debug/iOS_logs/$(date +%Y%m%d-%H%M).txt 2>&1&"
  sleep(5)
end

# If there was an unexpected failure, kill appium and remove the file.
if `ps -A | grep -m1 appium | awk '{print $1}'`
  system "kill -9 `ps -A | grep -m1 appium | awk '{print $1}'`"
end

# If platform is android or ios create driver instance for mobile browser
case $platform
  when 'android', 'iOS'
      if $browser_type == 'native'
        $browser_type = "Browser"
      end

      if $platform == 'android'
        $device_name, $os_version = get_device_info
      end

      if $platform == 'iOS'
        $noReset = true
      end

      desired_caps = {
          caps:       {
              platformName:  $platform,
              browserName: $browser_type,
              versionNumber: $os_version,
              deviceName: $device_name,
              udid: $udid,
              app: ".//#{$app_path}",
              automationName: $automationName,
              noReset: $noReset
          },
      }
      begin
        system 'nohup appium > features/debug/appium_logs/$(date +%Y%m%d-%H%M).txt 2>&1&'
        sleep(10)
        $driver = Appium::Driver.new(desired_caps).start_driver
      rescue Exception => e
        puts e.message
        Process.exit(0)
      end
  # local testing
  when 'desktop'
    begin
      $driver = Selenium::WebDriver.for(:"#{$browser_type}")
      $driver.manage().window().maximize()
    rescue Exception => e
      puts e.message
      Process.exit(0)
    end
  # else test on browserstack
  else
    $bs_username  = ENV['BS_USERNAME'] = 'ericsavoie1'
    $bs_authkey   = ENV['BS_AUTHKEY'] = 'RARq6L6DoCsWtjHgW3y4'
    url = "http://#{ENV['BS_USERNAME']}:#{ENV['BS_AUTHKEY']}@hub-cloud.browserstack.com/wd/hub"

    capabilities = Selenium::WebDriver::Remote::Capabilities.new

    # capabilities['project'] = ENV['BS_AUTOMATE_PROJECT'] if ENV['BS_AUTOMATE_PROJECT']
    # capabilities['build'] = ENV['BS_AUTOMATE_BUILD'] if ENV['BS_AUTOMATE_BUILD']

    if ENV['BS_AUTOMATE_OS']
      capabilities['os'] = ENV['BS_AUTOMATE_OS']
      capabilities['os_version'] = ENV['BS_AUTOMATE_OS_VERSION']
    else
      capabilities['platform'] = ENV['PLATFORM']
    end
    capabilities['browser'] = ENV['SELENIUM_BROWSER'] || 'chrome'
    capabilities['browser_version'] = ENV['BROWSER_VERSION']

    $driver = Selenium::WebDriver.for(:remote, :url => url, :desired_capabilities => capabilities)
    puts $driver
end
