require 'page-object'
require 'selenium'

#I do not find a ruby binding implementation of LoadableComponent
class SearchResults
  include PageObject
  
  # I don't use the query since I can't extend LoadableComponent in Ruby
#  @@query = "" 
#  def self.query
#    @@query
#  end
#  
#  def self.query(var)
#    @@query = var
#  end
  
  #used via HomePage
  def open()
  end
  
  def close()
  end
  
  def get_products()
    productList = @browser.find_elements(:css => "ul.products-grid > li")
    products = []
    productList.each do |productLi|
      thisProduct = productLi.find_element(:css => "h2 > a").text
      products.push(thisProduct)        
    end
    return products
  end
  def Search()
    return Search.new @browser
  end
  
end

