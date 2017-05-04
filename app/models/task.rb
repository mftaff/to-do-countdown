class Task < ActiveRecord::Base
  belongs_to :user
  
  validates :name, length: { minimum: 3 }, presence: true
  
  default_scope { order('created_at desc') }
end
