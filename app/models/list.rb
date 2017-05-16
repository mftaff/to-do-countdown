class List < ActiveRecord::Base
  belongs_to :user
  has_many :tasks, dependent: :destroy
  
  validates :title, length: { minimum: 3 }, presence: true 
  validates :user, presence: true
end
