require "selenium-webdriver"
require "test/unit"
require "rubygems"
require "CSV"
require_relative '../Extenders/ObjectMap'


class TestChapterFive < Test::Unit::TestCase
  def setup
    @driver = Selenium::WebDriver.for :firefox
    @testName = "ChapterSix"
  end
  
  def test_recipe_five
    objMap = ObjectMap.new
    google = objMap.page_objects['Google']
    @driver.get google.url
    google.elements['search_box'].get_element(@driver).send_keys("hello world")
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