require 'selenium-webdriver'
require "test/unit"


class TestChapterThree < Test::Unit::TestCase
  def setup
    @driver = Selenium::WebDriver.for :firefox
    @testName = "Chapter3"
  end
#  def test_recipe_one
#    @driver.manage.timeouts.implicit_wait = 10 # seconds
#    @driver.navigate.to "http://dl.dropbox.com/u/55228056/AjaxDemo.html"
#    assert(@driver.title == "A simple AJAX website with jQuery", "Something is unexpectedly in the title: " + @driver.title )
#    @driver.find_element(:link_text,"Page 4").click
#    assert(@driver.find_element(:id,"page4").text.include?("Nunc nibh tortor"), "I'm not finding the expected text in the body")
#    #assert(driver.findElement(:link_text, "Page 4").getText.include?("Nunc nibh tortor"))
#
#    getScreenShot("SiteOpen")
#  end
#  
#  def test_recipe_two
#    @driver.navigate.to "http://www.google.com"
#    query = @driver.find_element(:name,"q")
#    query.send_keys("selenium")
#    #possible errata. Am I clicking on the query box or the go button
#    #query.click
#    @driver.find_element(:id,"gbqfb").click
#    wait = Selenium::WebDriver::Wait.new(:timeout=>10)
#    wait.until{@driver.title.include?("selenium")}
#    assert(@driver.title.downcase.start_with?("selenium","Unexpected title at the end of recipe two"))
#    getScreenShot("End_recipe_two")
#  end
  
#  def test_recipe_three
#    #per "http://dl.dropbox.com/u/55228056/AjaxDemo.html" The ExpectedConditions package (Java) (Python) (.NET) contains a set of predefined conditions to use with WebDriverWait.
#    # in other words, no implementation in Ruby bindings
#
#
#    
#  end
#  
#  def test_recipe_four
#    @driver.navigate.to "http://www.google.com"
#    assert(is_element_present(:id,"gbqfba"))
#    assert(is_element_present(:name,"btnK"))
#    assert(!is_element_present(:id,"not_here"))  
#    getScreenShot("End_recipe_four")
#
#  end
#  
#  def test_recipe_six
#    @driver.navigate.to "http://10.30.0.144/test/Chapter3.aspx"
#    parentWindowHandle = @driver.window_handle
#    @driver.find_element(:id,"helpbutton").click
#    begin
#      @driver.switch_to.window("HelpWindow")
#      assert(@driver.title=="Help","Wrong title:"+@driver.title)
#    rescue    
#      flunk("I was unable to switch to that window")
#    end
#    getScreenShot("End_recipe_six")
#
#  end
#  
#
#    def test_recipe_seven
#      @driver.navigate.to "http://10.30.0.144/test/Chapter3.aspx"
#      parentWindowHandle = @driver.window_handle
#      @driver.find_element(:id,"helpbutton").click
#      begin
#        @driver.window_handles.each do |handle| 
#          @driver.switch_to.window(handle)
#          if(@driver.title == "Help")
#            @driver.close
#            break
#          end
#        end
#        @driver.switch_to.window(parentWindowHandle)
#        assert(@driver.title.include?("Chapter3"),"Wrong title:"+@driver.title)
#      rescue    
#        flunk("I was unable to switch to that window")
#      end
#      getScreenShot("End_recipe_seven")
#
#    end  
#  
  def test_recipe_nine
      @driver.navigate.to "http://10.30.0.144/test/Chapter3.aspx"
      parentWindowHandle = @driver.window_handle
      @driver.find_element(:id,"ButtonJavaScriptAlert").click
      begin
        alert = @driver.switch_to.alert
        assert(alert.text == "Javascript Alert 123","Wrong alert text:" + alert.text)
        alert.accept
      rescue    
        flunk("I was unable to switch to that window")
      end
    getScreenShot("End_recipe_nine")

  end  
  
    def test_recipe_fourteen
      @driver.navigate.to "http://10.30.0.144/test/Chapter3.aspx"
      twitterFrame = @driver.find_element(:tag_name,"iframe")
      @driver.switch_to.frame(twitterFrame)
      @driver.find_element(:id,"follow-button").click
      parentWindowHandle = @driver.window_handle
      begin
        @driver.window_handles.each do |handle| 
          @driver.switch_to.window(handle)
          if(@driver.title == "Unmesh Gundecha (@upgundecha) on Twitter")
            @driver.close
            break
          end
          
        end
        @driver.switch_to.window(parentWindowHandle)
        assert(@driver.title.include?("Chapter3"),"Wrong title:"+@driver.title)
      rescue    
        flunk("I was unable to switch to that window")
      end
      getScreenShot("End_recipe_fourteen")
    
    end  
  
  
  
  def is_element_present(how,what)
    begin
      @driver.find_element(how,what)
      return true
    rescue
      return false    
    end
  end
  
  def teardown
    @driver.quit
  end
  
  def getScreenShot(stepName)
    scpath = "C:\\Screenshots\\" + @testName + "_" + stepName +".png"
    File.delete(scpath) if File::exists?(scpath)
    @driver.save_screenshot(scpath)
  end
end
