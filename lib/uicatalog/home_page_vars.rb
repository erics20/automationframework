class UICatalogHomePageVars
  include SharedFunctions

  def initialize
    @ui_catalog          = $driver.find_element(:name => 'UICatalog')
    @action_sheets       = $driver.find_element(:name => 'Action Sheets')
    @activity_indicators = $driver.find_element(:name => 'Activity Indicators')
    @alert_views         = $driver.find_element(:name => 'Alert Views')
    @buttons             = $driver.find_element(:name => 'Buttons')
    @date_picker         = $driver.find_element(:name => 'Date Picker')
    @image_view          = $driver.find_element(:name => 'Image View')
    @page_control        = $driver.find_element(:name => 'Page Control')
    @picker_view         = $driver.find_element(:name => 'Picker View')
    @progress_views      = $driver.find_element(:name => 'Progress Views')
    @segmented_controls  = $driver.find_element(:name => 'Segmented Controls')
    @sliders             = $driver.find_element(:name => 'Sliders')
    @steppers            = $driver.find_element(:name => 'Steppers')
    @switches            = $driver.find_element(:name => 'Switches')
    @text_fields         = $driver.find_element(:name => 'Text Fields')
    @text_view           = $driver.find_element(:name => 'Text View')
    @web_view            = $driver.find_element(:name => 'Web View')
    @search_bars         = $driver.find_element(:name => 'Search Bars')
    @toolbars            = $driver.find_element(:name => 'Toolbars')

    create_getters
  end
end