Given /^I am on the lamps page$/ do
  visit lamps_path
end

Then /^I should see a list of lamp$/ do
  page.should have_content "Mongoid view"
end

But /^I shouldn't see more than (\d+) lamps$/ do |number_per_page|
  
end

