require "selenium-webdriver"
require "test/unit"
require "rubygems"
#require "CSV"
require 'browsermob/proxy'
require_relative '../Extenders/ObjectMap'


class TestChapterEight < Test::Unit::TestCase
  def setup
    #adding BrowserMob proxy info
    @server = BrowserMob::Proxy::Server.new("C:\\browsermob-proxy-2.0-beta-9\\bin\\browsermob-proxy.bat")  
    @server.start
    @proxy = @server.create_proxy
    @profile = Selenium::WebDriver::Firefox::Profile.new
    @profile.proxy = @proxy.selenium_proxy
    @driver = Selenium::WebDriver.for :firefox, :profile => @profile
    @testName = "ChapterSix"
  end
#  def test_recipe_one
#      @driver.get "About:blank"
#      start = Time.now
#      @driver.get "https://news.google.com"
#      wait = Selenium::WebDriver::Wait.new(:timeout => 3)
#      wait.until { driver.find_element(:xpath =>"/html/body/div[3]/div/div/div/div/div/div/div[3]/div/div/div").displayed? }
#      stop = Time.now  
#      test_time = stop - start
#      puts "Test time:" + test_time
#      assert(@driver.title=="Google News")
#      #this will fail using the iPhone because it is not in the mobile version of the web site
#      #@driver.find_element(:xpath =>"/html/body/div[3]/div/div/div/div/div/div/div[3]/div/div/div").click
#      get_screenshot("_recipe_one_end")
#  end
#  
#  
  def test_recipe_three
    @proxy.new_har "google"
    @driver.get "http://www.google.com"
    @har = @proxy.har
    @har.entries.first.request.url
    @har.save_to "C:\\Tmp\\google.har"
    
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
      @proxy.close
      @driver.quit
    end
    
    def get_screenshot(stepName)
      scpath = "C:\\Screenshots\\" + @testName + "_" + stepName +".png"
      File.delete(scpath) if File::exists?(scpath)
      @driver.save_screenshot(scpath)
    end
  end