require "selenium-webdriver"
require "test/unit"
require "rubygems"
require "CSV"
require_relative '../Extenders/ObjectMap'


class TestChapterSeven < Test::Unit::TestCase
  def setup
    #@driver = Selenium::WebDriver.for :firefox
    @testName = "ChapterSix"
  end
#  def  test_recipe_three
#      @driver = Selenium::WebDriver.for :remote, :url => "http://10.0.4.152:3001/wd/hub", :desired_capabilities=>:iphone
#      @driver.get "About:blank"
#      @driver.get "https://news.google.com"
#      assert(@driver.title=="Google News")
#      #this will fail using the iPhone because it is not in the mobile version of the web site
#      #@driver.find_element(:xpath =>"/html/body/div[3]/div/div/div/div/div/div/div[3]/div/div/div").click
#      get_screenshot("_recipe_three_end")
#  end
  
  def test_recipe_six
    @driver = Selenium::WebDriver.for :remote, :url => "http://localhost:8080/wd/hub", :desired_capabilities=>:android
    @driver.get "About:blank"
    @driver.get "https://news.google.com"
    assert(@driver.title=="Google News")
  end
  
  
  
  def is_element_present(how,what)
      begin
        @driver.find_element(how,what)
        return true
      rescue
        return false    
      end
    end
    
    def compare_allow_empty_for_nil(this,that)
      match = false
      if(this==nil)
        match = (this==that)|(that=="")
      elsif (that==nil)
        match = (this==that)|(this=="")
      else
        match = this==that
      end
      return match    
    end  
    
    def teardown
      @driver.quit
    end
    
    def get_screenshot(stepName)
      scpath = "C:\\Screenshots\\" + @testName + "_" + stepName +".png"
      File.delete(scpath) if File::exists?(scpath)
      @driver.save_screenshot(scpath)
    end
  end