require 'page-object'
require 'selenium'
require_relative 'PageObjectMagentoCommerceSearchResults'

#I do not find a ruby binding implementation of LoadableComponent
class Search
  include PageObject
  text_field(:search, :id=> "search")
  button(:searchButton,:css=>"#search_mini_form > div > button")
  
  #emptying out these because this is intended as a child object to Home Page
  def open()
  end
  
  def close()
  end
    
  
  def search_in_store(query)
    search_element.send_keys(query)
    searchButton_element().click
    results = SearchResults.new @browser
    return results.get_products
  end
  
  
  
end

