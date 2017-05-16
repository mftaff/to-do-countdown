class TasksController < ApplicationController
    def create
        expires_at_format unless params[:task][:expires_at].blank? # adds the current time to a user created date
        
        @task = current_user.lists.find(params[:task][:current_list_id]).tasks.new(task_params)
        @task.user = current_user

        if @task.save
            flash.now[:notice] = "\"#{@task.name}\" added to To-Do list!"
        else
            if @task.errors.any?
                flash.now[:alert] = "Task not saved. #{@task.errors.full_messages.join '. ' }."  
            else
                flash.now[:alert] = "Something went wrong! Your task was not saved... "
            end
        end

        respond_to do |format|
            format.html { redirect_to root_path }
            format.js
        end
    end
    
    def destroy
        @task = Task.find(params[:id])
        
        if @task.destroy
            flash.now[:notice] = "Nice work! Task completed and removed from list!"
        else 
            flash.now[:alert] = "An issue occured while trying to delete completed task..."
        end
        
        respond_to do |format|
            format.html { redirect_to root_path }
            format.js
        end
        
    end
    
    private
    
    def task_params
        params.require(:task).permit(:name, :expires_at)
    end
    
    def expires_at_format
        params[:task][:expires_at] += " #{Time.now.strftime("%I:%M:%S %z")}"
    end
end
