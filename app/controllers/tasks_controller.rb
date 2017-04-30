class TasksController < ApplicationController
    def create
        @task = Task.new(task_params)
        @task.user = current_user
        
        if @task.save
            flash[:notice] = "New task added!"
            redirect_to root_path
        else 
            flash.now[:alert] = "There was an error saving your task. Task not saved."
            redirect_to root_path
        end
    end
    
    private
    
    def task_params
        params.require(:task).permit(:name)
    end
end
