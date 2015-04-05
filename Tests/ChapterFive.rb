require "selenium-webdriver"
require "test/unit"
require "rubygems"
require "CSV"
require_relative '../PageObjects/PageObjectBMI'
require_relative '../PageObjects/PageObjectMagentoCommerceHomePage'
require_relative '../PageObjects/PageObjectMagentoCommerceSearch'
require_relative '../PageObjects/PageObjectMagentoCommerceSearchResults'
require "page-object/page_factory"


class TestChapterFive < Test::Unit::TestCase
  def setup
    @driver = Selenium::WebDriver.for :firefox
    @testName = "ChapterFive"
  end
#     def test_recipe_seven
#      test_executed = 0
#      test_passed = 0
#      test_failed = 0
#      bmi_calc = BmiCalcPage.new(@driver)
#      bmi_calc.open()
#      CSV.foreach("C:\\Data\\recipe_four_eight.csv") do |row|
#        if (row[0]!="Height")
#          begin
#            test_status = true
#            test_executed = test_executed + 1
#            puts "Test " + test_executed.to_s()
#  
#            bmi_calc.calculate_bmi(row[0],row[1])
#            assert(compare_allow_empty_for_nil(bmi_calc.bmi,row[2]) ,"mismatch on bmi. ")
#            assert(compare_allow_empty_for_nil(bmi_calc.bmi_category,row[3]), "mismatch on bmi category. ")
#            if test_status
#            test_passed = test_passed + 1
#            else
#            test_failed = test_failed + 1
#            end
#            get_screenshot("test " + test_executed.to_s())
#            #bmi_calc.close()
#            @driver.get "http://dl.dropbox.com/u/55228056/bmicalculator.html"
#          rescue Exception => e
#            flunk("something went wrong: " + e.message)
#          end
#  
#        end
#      end
#      bmi_calc.close()
#    end
  #  
    def test_recipe_four
      home = HomePage.new @driver
      home.open
      #search = home.search()
      results = home.search().search_in_store("sony")
      assert(results.length ==2)
      assert(results.include?("Sony Ericsson W810i"),"Did not find the expected results. Here is what I found: " + results.to_s())
      assert(@driver.title.include?"Search result" )
      
    end
    
    #I couldn't make this work
#    def test_page_factory
#      @browser = @driver
#      visit_page BMICalcPage do |page|
#        page.calculate_bmi('181','80')
#        assert_equal('24.4',page.bmi)
#      end
#      
#      
#    end

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