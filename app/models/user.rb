class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation
  has_secure_password
  
  has_many :boards
  has_many :advertisements
  has_many :payment_details
  
  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token
  
  
  validates :name, presence: true, length: { maximum: 50 }
  validates :password, length: { minimum: 6 }
  validates :password_confirmation, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  
  private
  
  def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
  end
  
end
