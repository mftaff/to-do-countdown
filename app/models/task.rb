class Task < ActiveRecord::Base
  belongs_to :user
  belongs_to :list
  
  before_save :update_expires_at
  
  validates :name, length: { minimum: 3 }, presence: true
  validates :user, presence: true
  validates :list, presence: true
  
  default_scope { order('expires_at desc') }
  
  scope :expired, -> {where('expires_at < ?', Time.now)}
  scope :unexpired, -> { where("expires_at >= ?", Time.now) }
  
  private
  
  def update_expires_at
    self.expires_at ||= Time.now + 7.days
  end
end
