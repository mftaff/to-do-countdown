class TasksController < ApplicationController
    def create
        @task = current_user.tasks.new(task_params)
        # @new_task = Task.new
        
        if @task.save
            flash[:notice] = "New task added!"
        else 
            flash.now[:alert] = "There was an error saving your task. Task not saved."
        end
        redirect_to root_path
        
        # respond_to do |format|
        #     format.html { redirect_to root_path }
        #     format.js
        # end
    end
    
    def destroy
        @task = Task.find(params[:id])
        
        @task.destroy
        respond_to do |format|
            format.html { redirect_to root_path }
            format.js
        end
        
    end
    
    private
    
    def task_params
        params.require(:task).permit(:name)
    end
end
