class ListsController < ApplicationController
    def index
        @lists = current_user.lists
        @list = List.new
    end
    
    def create
        @list = current_user.lists.new(list_params)

        if @list.save
            flash.now[:notice] = "New To-Do created: \"#{@list.title}\"!"
        else
            if @task.errors.any?
                flash.now[:alert] = "List not created. #{@task.errors.full_messages.join '. ' }."  
            else
                flash.now[:alert] = "Something went wrong! Your list wasn't created... "
            end
        end
        redirect_to lists_path
        # respond_to do |format|
        #     format.html { redirect_to root_path }
        #     format.js
        # end
    end
    
    def destroy
        @list = List.find(params[:id])
        
        if @list.destroy
            flash.now[:notice] = "To-Do list successfully deleted."
        else 
            flash.now[:alert] = "An issue occured while trying to delete To-Do lis..."
        end
        redirect_to lists_path
        # respond_to do |format|
        #     format.html { redirect_to root_path }
        #     format.js
        # end
    end
    
    private
    
    def list_params
        params.require(:list).permit(:title)
    end
end
