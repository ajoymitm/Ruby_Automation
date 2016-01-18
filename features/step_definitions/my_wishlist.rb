Given(/^I click on MY WishList$/) do
  on(MY_WishList_Page).click_wishlist
end

And(/^I Enter the name$/) do
  on(MY_WishList_Page).enter_name="testajoy"
end


And(/^I click on Save Button$/) do
  on(MY_WishList_Page).click_save
end