Given /^I am on BMI Calculator$/ do
  visit "http://dl.dropbox.com/u/55228056/bmicalculator.html"
end

When /^I fill in the following:$/ do |table|
  table.rows_hash.each {|field,value|fill_in field, :with=>value }
end

When /^I press "([^"]*)"$/ do |button|
  click_button(button)
end

Then /^I should see following$/ do |table|
  table.rows_hash.each {|field,value| find_field(field).value should == value}
end



