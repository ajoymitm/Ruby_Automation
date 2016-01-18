class Login_Page < Test::Unit::TestCase
  include WatirPageHelper
  include PageObject

  link(:click_signin, :class => "login")
  text_field(:enter_username, :id => 'email')
  text_field(:enter_password, :id => 'passwd')
  button(:click_login,:id =>'SubmitLogin' )
  page_url TEST_DATA['default_base_url']
  expected_title("My account - My Store")

  #Method to input username and password on login page
  def input_credential

    self.enter_username = TEST_DATA['username']
    self.enter_password = TEST_DATA['password']

  end

  def verify_login
    has_expected_title?

  rescue Exception => e
    $sys_message = e.message
    assert(false,"Problem in Loading Login page")
  end
  end