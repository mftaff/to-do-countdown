class AddExpiredToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :expired, :boolean, default: false
  end
end
