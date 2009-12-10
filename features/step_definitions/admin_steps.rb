Given /^I am logged in$/ do
  basic_auth('user', 'secret')
end


Then /^I should see :([\w\.]+)$/ do |label|
  text = I18n.t label
  assert_contain text
end
