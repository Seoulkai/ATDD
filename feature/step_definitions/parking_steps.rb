When(/^I park my car in the (.+) lot for (.+)$/) do |location, duration|
  $parking_lot.select(location)
  $parking_lot.enter_time_for(duration)
  $parking_lot.calculate
end

Then(/^I will have to pay (.+)$/) do |price|
  $parking_lot.get_cost.should == price
end