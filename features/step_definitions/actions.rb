# frozen_string_literal: true
require 'selenium/webdriver/firefox'
require 'selenium-webdriver'
require 'rspec'
module Actions
  def visible(element)
    element.displayed?
  end
end
