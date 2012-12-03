class User < ActiveRecord::Base
  attr_accessible :email, :name
  has_secure_password
  
  has_many :boards
  has_many :advertisements
  has_many :payment_details
  
  
  before_save :create_remember_token
  
  
  validates :name, presence: true, length: { maximum: 50 }
  validates :password, length: { minimum: 6 }
  validates :password_confirmation, presence: true
  validates :email, presence:   true, uniqueness: { case_sensitive: false }
  
  private
  
  def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
  end
  
end
