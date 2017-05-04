class Task < ActiveRecord::Base
  belongs_to :user
  
  validates :name, length: { minimum: 3 }, presence: true
  
  default_scope { order('created_at desc') }
  
  scope :expired, -> { where(expired: true) }
  scope :unexpired, -> { where("expired IS NULL OR expired = ?", false) }
end
