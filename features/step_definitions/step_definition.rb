# frozen_string_literal: true

require 'selenium-webdriver'
require 'selenium/webdriver/chrome'
require 'selenium/webdriver/firefox'
require 'rubygems'
require 'rspec'
require_relative 'actions.rb'
driver ||= " "
element ||= " "
options = Selenium::WebDriver::Chrome::Options.new
options.add_argument('--ignore-certificate-errors')
options.add_argument('--disable-popup-blocking')
options.add_argument('--disable-translate')

Given(/^opened google search page$/) do
  driver = Selenium::WebDriver.for :chrome, options: options
  driver.get('https://4pda.ru/forum')
  sleep(1)
  driver.get('https://www.bing.com')
end

And(/^search string is selected$/) do
  element = driver.find_element(:name, 'q')
end

When(/^(.*) are entered$/) do |searchStr|
  element.send_keys searchStr
end

And(/^submitted$/) do
  element.send_keys :enter
end

Then(/^title should contain (.*)$/) do |searchStr|
  raise "Wrong condition!" unless driver.title.casecmp(searchStr)
end
