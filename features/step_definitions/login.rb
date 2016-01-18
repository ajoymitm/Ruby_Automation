Given(/^I am on Login Page$/) do
  visit_page Login_Page do|page|
    page.click_signin
  end
   end

When(/^I provide valid credentials$/) do
  on(Login_Page).input_credential
  end

Then(/^I should get logged in$/) do
  on(Login_Page).verify_login
end


And(/^I click on Login button$/) do
  on(Login_Page).click_login
end