class Task < ActiveRecord::Base
  belongs_to :user
  
  before_save :update_expires_at
  
  validates :name, length: { minimum: 3 }, presence: true
  # validate :expires_at_is_valid_datetime
  
  default_scope { order('expires_at desc') }
  
  scope :expired, -> {where('expires_at < ?', Time.now)}
  scope :unexpired, -> { where("expires_at >= ?", Time.now) }
  
  private
  
  def update_expires_at
    self.expires_at ||= Time.now + 7.days
  end
  
  def expires_at_is_valid_datetime
    errors.add(:expires_at, 'must be a valid datetime') if ((DateTime.parse(expires_at) rescue ArgumentError) == ArgumentError)
  end
end
