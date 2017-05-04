class UsersController < ApplicationController
  def show
    @task = Task.new
    @tasks = current_user.tasks.unexpired
    @expired_tasks = current_user.tasks.expired
  end
end
