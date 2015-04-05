require "selenium-webdriver"
require "test/unit"
require "rubygems"
require "CSV"
require_relative '../Extenders/ObjectMap'


class TestChapterSeven < Test::Unit::TestCase
  def setup
    @driver = Selenium::WebDriver.for :firefox
    @testName = "ChapterNine"
  end
  
#  def test_recipe_three
#    #first load a page, any page
#    @driver.manage.timeouts.implicit_wait = 10 # seconds
#    @driver.get "http://www.google.com"
#    #next store a local variable
#    assert(@driver.title.include?("Google"),"page did not load")
#    expected = "yomama"
#    @driver.execute_script("localStorage.setItem(\"mgsTestLocal\",\"" + expected + "\")")
#    actual = @driver.execute_script("return localStorage.mgsTestLocal")
#    assert(actual==expected,"values do not match")
#  end
  
#  def test_recipe_four
#      #first load a page, any page
#      @driver.manage.timeouts.implicit_wait = 10 # seconds
#      @driver.get "http://www.google.com"
#      #next store a local variable
#      assert(@driver.title.include?("Google"),"page did not load")
#      expected = "yomama"
#      @driver.execute_script("sessionStorage.setItem(\"mgsTestSession\",\"" + expected + "\")")
#      actual = @driver.execute_script("return sessionStorage.mgsTestSession")
#      assert(actual==expected,"values do not match")
#  end
    
  def test_recipe_five
      #first load a page, any page
      @driver.manage.timeouts.implicit_wait = 10 # seconds
      @driver.get "http://www.google.com"
      #next store a local variable
      assert(@driver.title.include?("Google"),"page did not load")
      expected = "yomama"
      @driver.execute_script("localStorage.setItem(\"mgsTestLocal\",\"" + expected + "\")")
      actual = @driver.execute_script("return localStorage.mgsTestLocal")
      assert(actual==expected,"local values do not match")
      @driver.execute_script("sessionStorage.setItem(\"mgsTestSession\",\"" + expected + "\")")
      actual = @driver.execute_script("return sessionStorage.mgsTestSession")    
      assert(actual==expected,"session values do not match")
      @driver.execute_script("localStorage.clear()")
      actual = @driver.execute_script("return localStorage.mgsTestLocal")    
      assert(actual==nil,"actual is not blank after clearing local")
      @driver.execute_script("sessionStorage.clear()")
      actual = @driver.execute_script("return sessionStorage.mgsTestSession")    
      assert(actual==nil,"actual is not blank after clearing session")
             
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