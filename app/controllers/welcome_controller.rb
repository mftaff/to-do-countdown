class WelcomeController < ApplicationController
  skip_before_action :authenticate_user!
  def landing
  end

  def about
  end
end