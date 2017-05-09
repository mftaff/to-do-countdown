class UsersController < ApplicationController
  def index
    @users = User.all
  end
  
  def show
    @task = Task.new
    @user = params[:id].present? ? User.find(params[:id]) : current_user

    unless current_user.friends.include?(@user) || @user == current_user
      flash[:alert] = "You need to be friends to view other peoples's TO-DO lists.."
      begin
        redirect_to :back and return
      rescue
        redirect_to root_path
      end
    end
    
    @tasks = @user.tasks.unexpired
    @expired_tasks = @user.tasks.expired
  end
  
  def send_friend_request # send a request to a diff user
    current_user.friend_request(get_target_user)
    
    redirect_to users_path
  end
  
  def accept_friend_request # accept someone's request to be your friend
    current_user.accept_request(get_target_user)
    
    redirect_to users_path
  end
  
  def decline_friend_request # decline someone's request to be your friend
    current_user.decline_request(get_target_user)
    
    redirect_to users_path
  end
  
  def unfriend # remove someone from being your friend (also kills a pending request)
    current_user.remove_friend(get_target_user)
    
    redirect_to users_path
  end
  
  private
  
  def get_target_user
    @user = User.find(params[:target_user])
  end
end
