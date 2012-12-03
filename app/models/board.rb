class Board < ActiveRecord::Base
  attr_accessible :height, :name, :timezone, :width
  
  has_many :tiles, through: :advertisements
  has_many :advertisements
  belongs_to :user
  has_one :payment_detail, as: :payable
  
  
  validates :name, presence: true
  validates :width, :numericality => { :greater_than_or_equal_to => 1 }
  validates :height, :numericality => { :greater_than_or_equal_to => 1 }
end
