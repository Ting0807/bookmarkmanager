Then(/^there should be  no links$/) do
  expect(page.has_xpath?('//section/ul')).to be_true
  expect(page.has_xpath?('//section/ul/li')).to be_false # express the regexp above with the code you wish you had
end