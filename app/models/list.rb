class List < ActiveRecord::Base
  belongs_to :user
  has_many :tasks, dependent: :destroy
  
  validates :title, length: { minimum: 3, maximum: 16 }, presence: true 
  validates :user, presence: true
  validate :validate_list_count
  
  def validate_list_count
    errors.add(:list, "not created. You may not have more that 4 active lists") if self.user.lists.count > 3
  end
end
