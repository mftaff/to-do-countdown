class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, 
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  
  has_many :tasks, dependent: :destroy
  has_many :lists, dependent: :destroy
  has_friendship
  
  before_save :update_email_name
  
  # Virtual attribute for authenticating by either username or email
  # This is in addition to a real persisted field like 'username'
  attr_accessor :login
  validates_format_of :username, with: /^[a-z0-9_\.]*$/, :multiline => true, :message => "is invalid. Make sure you have no uppercase letters!"
  validate :validate_username
  validates :username, length: {minimum: 5, maximum: 20 }, presence: true 

  def validate_username
    if User.where(email: username).exists?
      errors.add(:username, :invalid)
    end
  end
 
  # overwrites devise's default <find_for_database_authentication> to include username 
  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_hash).where(["username = :value OR lower(email) = :value", { :value => login.downcase }]).first
    elsif conditions.has_key?(:username) || conditions.has_key?(:email)
      conditions[:email].downcase! if conditions[:email]
      where(conditions.to_hash).first
    end
  end
  
  def update_email_name
    self.email_name = "#{self.email.split('@').first}"
  end
  
  # gives this model search functionality
  def self.search(search)
    where("username LIKE ? OR email_name LIKE ?", "%#{search}%", "%#{search}%")
  end
end
