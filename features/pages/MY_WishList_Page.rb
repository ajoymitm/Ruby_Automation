class MY_WishList_Page < Test::Unit::TestCase
  include WatirPageHelper
  include PageObject

text_field(:enter_name, :name=> 'name')
button(:click_save, :id=> 'submitWishlist')

def click_wishlist
  @browser.a(:title =>'My wishlists').click
end
end
