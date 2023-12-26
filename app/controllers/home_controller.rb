# frozen_string_literal: true

class HomeController < ApplicationController
  def hello
    Sentry.capture_message('test message')
  end
end
