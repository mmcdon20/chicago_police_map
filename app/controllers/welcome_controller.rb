class WelcomeController < ApplicationController
  def index
    @count = Crime.count
  end
end
