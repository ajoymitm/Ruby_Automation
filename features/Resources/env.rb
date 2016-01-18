require 'cucumber'
require 'rubygems'
require 'watir-webdriver'
require "rspec"
require 'builder'
require 'natural_sort_kernel'
require 'minitest/autorun'
require 'minitest/unit'
require "test/unit/assertions"
# require 'minitest/spec'
# require 'minitest/mock'
require 'test/unit/testcase'
require 'page-object/page_factory'
require 'logger'
require 'watir-webdriver/attribute_helper'
require 'watir-page-helper'
require 'page-object'
require 'fileutils'
Object.send :remove_const, :Config
Config = RbConfig
require 'watirgrid'
require 'em-dir-watcher'
require 'eventmachine'
require 'au3'
require 'win32ole'

World PageObject::PageFactory


# Creating object for YML file
# TESTENV varibale is am environment variable
TEST_DATA = YAML.load_file("#{File.dirname(__FILE__)}/../../Config_Files/#{ENV['TESTENV']}.yml")

# Method to set the base url
# base_url is an environment variable
# default_base url is present in YML file
def set_base_url
  @base_url = (ENV['base_url'].nil? || ENV['base_url'].empty?) ? TEST_DATA['default_base_url'] : ENV['base_url']
end

# calling set_base_url function
# set_base_url

# file = File.open('log_file.log',File::WRONLY | File::APPEND |File::CREAT)
$LOG=Logger.new('log_file.log')
# selecting browser
# browser is an environment variable
# task to be performed before running every scenario
Before do |scenario|
  case ENV['browser']
    when 'mozilla'
      @browser= Watir::Browser.new :firefox
    when 'chrome'
      @browser= Watir::Browser.new :chrome
    else
      profile = Selenium::WebDriver::Firefox::Profile.new
      profile['browser.download.dir'] = "D:\\Ruby_Automation\\Screenshots"
      profile['browser.download.folderList'] = 2
      profile["pdfjs.disabled"] = true
      profile['browser.helperApps.neverAsk.saveToDisk'] = "application/csv,application/pdf,image/png,image/jpeg"
      @browser = Watir::Browser.new :firefox, :profile => profile
  end
  @feature_name =scenario.feature.title
  $LOG.info("FEATURE NAME =>"+"#{@feature_name}")
  @browser.window.maximize
  @sc_name=scenario.name
  $LOG.info("SCENARIO NAME =>  "+"#{@sc_name}")
  @step_count = 0
end
# task to be performed after each step
AfterStep do |step|
  @step_count += 1
end
# task to be performed after running every scenario
After do |scenario|
  if scenario.failed?
    # puts "inside sceanrio failed"
    puts scenario.steps.to_a[@step_count].gherkin_statement.name
    $step_title = scenario.steps.to_a[@step_count].gherkin_statement.name
    Custom_Exception.handle_exception
  end
  s=@browser.cookies.to_a
  @browser.cookies.clear
  k=@browser.cookies.to_a
  # @browser.close
end
# task to be performed just before exit(at last)
at_exit do
  my_dir = Dir["D:/Ruby_Automation/log_file.log"]
  my_dir.each do |filename|
    name = File.basename('log_file_new', '.log')[0, 4]
    name1=[Time.now.strftime("%Y-%m-%d-%H%M%S"), name].join("_")
    dest_folder = "D:/Ruby_Automation/Log_Files/#{name1}"
    FileUtils.cp(filename, dest_folder)
    $LOG.close
    FileUtils.rm("D:/Ruby_Automation/log_file.log", :force => true)
  end
end