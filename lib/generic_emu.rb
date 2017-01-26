class GenericEmulator
  include FirePoll
  include Appium::Common



  def element_enabled(element)
    element.enabled?
  end

  def move_to_element(element)
    if element.displayed? == false
      $driver.execute_script "mobile: scroll", :direction => 'down'
      # move_to_element(element)
    end
  end

  def click(element)
    element.click
  end

  def scroll_and_click(element, direction)
    if element.displayed? == false
      $driver.execute_script "mobile: scroll", :direction => "#{direction}"
      self.scroll_and_click(element, direction)
    end
    element.click
  end

  def send_keys(element,text)
    element.send_keys text
  end

  def get_element_text(element)
    element.text
  end

  # Function Graveyard

  # def move_to_element(element, start_x = 0, start_y = 0)
  #   begin
  #     ele_from = WAIT.until {element}.location
  #     end_x = ele_from.x
  #     end_y = ele_from.y
  #
  #     action = Appium::TouchAction.new.press(x: "#{start_x}", y: "#{start_y}").wait(1000).move_to(x: "#{end_x}", y:  "#{end_y}").release()
  #     action.perform
  #   rescue Exception => e
  #     if e.to_s == 'The swipe did not complete succesfully'
  #       print ""
  #     else
  #       raise e
  #     end
  #   end
  # end

  # def check_element_enable(access_type, access_name, test_case)
  #   result = is_element_enabled(access_type, access_name)
  #   if test_case
  #     expect(result).to be true
  #   else
  #     expect(result).to be false
  #   end
  # end
  #
  # def long_press_on_element_default_duration(element)
  #   puts element
  #   begin
  #     ele_from = WAIT.until { element }.location
  #     x = ele_from.x
  #     y = ele_from.y
  #
  #     puts ele_from
  #
  #     action = Appium::TouchAction.new.press(x: "#{x}", y: "#{y}").wait(2000).move_to(x: "#{x}", y:  "#{y}").release()
  #     action.perform
  #   rescue Exception => e
  #     if e.to_s == 'The swipe did not complete successfully'
  #       print ""
  #     else
  #       raise e
  #     end
  #   end
  # end

end