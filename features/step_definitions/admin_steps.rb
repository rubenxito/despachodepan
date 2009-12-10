Given /^I am logged in$/ do
  basic_auth('user', 'secret')
end

When /^I follow :([\w\.:]+)$/ do |label|
  text = I18n.t label.gsub(/:/, '.')
  click_link text
end

When /^I press :([\w\.:]+)$/ do |label|
  text = I18n.t label.gsub(/:/, '.')
  click_button text
end



Then /^I should see :([\w\.:]+)$/ do |label|
  text = I18n.t label.gsub(/:/, '.')
  assert_contain text
end
