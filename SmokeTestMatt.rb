

require 'selenium-webdriver'
#this is a comment
driver = Selenium::WebDriver.for :firefox
driver.navigate.to "http://prizmshare.com"
#this is another comment
wait = Selenium::WebDriver::Wait.new(:timeout => 3)
wait.until { driver.find_element(:link_text, 'View All').displayed? }
elements = driver.find_elements(:tagname, 'a')



driver.quit