# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @broadcasting_users = User.streaming
  end
end
