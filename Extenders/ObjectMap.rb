require 'rubygems'
require 'xmlsimple'
require "selenium-webdriver"

class ObjectMap
  def initialize
    @page_objects = Hash.new
    xmlObjects = XmlSimple.xml_in('ObjectMap.xml')
    xmlPageObjects = xmlObjects['pageObject']
    xmlPageObjects.each do |po|
      pageObject = PageObject.new(po['name'],po['url'])
      pageElements = Hash.new
      elementsContainer = po['seleniumElements']
      elementsCollection = elementsContainer[0]
      elementsCollection['seleniumElement'].each do |el|
        pageElement = PageElement.new(el['logicalName'],el['locatorType'],el['locatorValue'])
        pageElements[pageElement.logical_name] = pageElement
      end     
      pageObject.elements = pageElements 
      @page_objects[po['name']]=pageObject
    end
   
  end
  
  def page_objects
    @page_objects
  end
  
  
end

class PageObject
  def initialize(name, url)
    @name = name
    @url = url
    @elements = Hash.new
  end
  def name
    @name
  end
  def url
    @url
  end
  def elements=(var)
    @elements = var
  end
  def elements
    @elements
  end
end

class PageElement
  def initialize(logical_name, locator_type, locator_value)
    @logical_name = logical_name
    @locator_type = locator_type
    @locator_value = locator_value
  end
  def logical_name
    @logical_name
  end
  def locator_type
    @locator_type
  end
  def locator_value
    @locator_value
  end
  def get_element(driver)
    case locator_type
    when "id"
      return_value = driver.find_element(:id=>locator_value)
    when "name"
      return_value = driver.find_element(:name=>locator_value)
    when "class"
      return_value = driver.find_element(:class=>locator_value)
    when "tag_name"
      return_value = driver.find_element(:tag_name=>locator_value)
    when "link_text"
      return_value = driver.find_element(:link_text=>locator_value)
    when "partial_link_text"
      return_value = driver.find_element(:partial_link_text=>locator_value)
    when "css"
      return_value = driver.find_element(:css=>locator_value)
    when "xpath"
      return_value = driver.find_element(:xpath=>locator_value)
    else
      return_value = nil
    end
  end
end

objMap = ObjectMap.new
