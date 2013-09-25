
#  Gherkin is a Business Readable, Domain Specific Language created especially for behavior descriptions. It gives you the ability to remove logic details from behavior tests.

# Gherkin serves two purposes: serving as your project’s documentation and automated tests

# some of the syntax will be recongnised by capabara (web related), but rspec will check the acutal code. 


Feature: Showing links
    I want to be able to save links that are useful and would like to see again. 

# the first scenario, imagine there is nothing have been established
Scenario: when there are no links
  Given I am on the homepage
  Then I should see 'Welcome to bookmark manger'
  And there should be no links


Scenario: when there is a link
  Given I 
