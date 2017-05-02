class Task < ActiveRecord::Base
  belongs_to :user
  
  validates :name, presence: true
  
  default_scope { order('updated_at DESC') }
end
