require 'selenium-webdriver'
require "test/unit"

class TestChapterTwo < Test::Unit::TestCase
  def test_screenshot
    driver = Selenium::WebDriver.for :firefox
    driver.navigate.to "http://prizmshare.com"
    #this is another comment
    wait = Selenium::WebDriver::Wait.new(:timeout => 3)
    wait.until { driver.find_element(:link_text, 'View All').displayed? }
      thisWorked = true
      begin  
        scpath = "C:\\Screenshots\\recipe2_09.png"
        File.delete(scpath) if File::exists?(scpath)
        driver.save_screenshot(scpath)
      rescue
        thisWorked = false
      end
      assert(thisWorked, "Error was encountered")
    
    driver.quit
  end
end


 

