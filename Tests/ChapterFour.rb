require "selenium-webdriver"
require "test/unit"
require "rubygems"
require "CSV"


#Roo was causing problems, so I went with CSV
class TestChapterFour < Test::Unit::TestCase
  def setup
    @driver = Selenium::WebDriver.for :firefox
    @testName = "ChapterFour"
  end
  def test_recipe_eight
    test_executed = 0
    test_passed = 0
    test_failed = 0
    CSV.foreach("C:\\Data\\recipe_four_eight.csv") do |row|
      if(row[0]!="Height")
        begin
          test_status = true
          test_executed = test_executed + 1
          puts "Test " + test_executed.to_s()
          @driver.get "http://dl.dropbox.com/u/55228056/bmicalculator.html"
          @driver.find_element(:name => "heightCMS").send_keys(row[0])
          @driver.find_element(:name  => "weightKg").send_keys(row[1])
          @driver.find_element(:id => "Calculate").click
          bmi = @driver.find_element(:name => "bmi")
          bmi_category = @driver.find_element(:name => "bmi_category")
          get_screenshot("test " + test_executed.to_s())
          assert(compare_allow_empty_for_nil(bmi.attribute("value"),row[2]) ,"mismatch on bmi. ")
          assert(compare_allow_empty_for_nil(bmi_category.attribute("value"),row[3]), "mismatch on bmi category. ")
          if test_status
            test_passed = test_passed + 1
          else
            test_failed = test_failed + 1
          end
        rescue Exception => e
          flunk("something went wrong: " + e.message)
        end
      end
        
    end

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
