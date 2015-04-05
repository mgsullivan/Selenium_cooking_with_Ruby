require 'page-object'
require 'selenium'
require_relative 'PageObjectMagentoCommerceSearch'

#I do not find a ruby binding implementation of LoadableComponent
class HomePage
  include PageObject
  
  def open()
    @browser.get 'http://demo.magentocommerce.com'
  end
  
  def close()
    @browser.close
  end
  
  def search()
    return Search.new @browser
  end
end

