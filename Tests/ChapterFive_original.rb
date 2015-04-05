require "selenium-webdriver"
require "test/unit"
require "rubygems"
require "CSV"
require 'page-object'

class BmiCalcPage
  include PageObject
  
  text_field(:height, :id=> 'heightCMS')
  text_field(:weight, :id=> 'weightKg')
  button(:calculate,:value=>'Calculate')
  text_field(:bmi, :id=> 'bmi')
  text_field(:bmi_category, :id=> 'bmi_category')
  
  def calculate_bmi(height,weight)
    self.height = height
    self.weight = weight
    calculate
  end
  
  def open()
    @browser.get 'http://dl.dropbox.com/u/55228056/bmicalculator.html'
  end
  
  def close()
    @browser.close
  end   
  
end

class TestChapterFive < Test::Unit::TestCase
  def setup
    @driver = Selenium::WebDriver.for :firefox
    @testName = "ChapterFive"
  end
  def test_recipe_seven
    bmi_calc = BmiCalcPage.new(@driver)
    bmi_calc.open()
    bmi_calc.calculate_bmi('181','80')
    assert_equal '24.4', bmi_calc.bmi
    assert_equal 'Normal', bmi_calc.bmi_category
    bmi_calc.close()
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