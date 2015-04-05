require 'capybara'
require 'cucumber'
require 'selenium/webdriver'
require "page-object/page_factory"
require_relative 'PageObjectBMI'


Capybara.default_driver = :selenium
Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, :browser => :firefox)
end