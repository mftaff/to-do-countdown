class UsersController < ApplicationController
  def show
    @task = Task.new # can I nest this under current_user?
    @tasks = Task.where(user: current_user)
  end
end
