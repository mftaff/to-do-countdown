class UsersController < ApplicationController
  def show
    @task = Task.new
    @tasks = Task.where(user: current_user)
  end
end
