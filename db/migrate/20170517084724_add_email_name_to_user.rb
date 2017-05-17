class AddEmailNameToUser < ActiveRecord::Migration
  def change
    add_column :users, :email_name, :string
  end
end
