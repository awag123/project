class Advertisement < ActiveRecord::Base
  attr_accessible :height, :image, :width, :x_location, :y_location
  
  has_many :tiles
  belongs_to :user
  belongs_to :board
  has_many :payment_details, as: :payables

  validates :image, presence: true
  validates :x_location, :numericality => { :greater_than_or_equal_to => 0 }
  validates :y_location, :numericality => { :greater_than_or_equal_to => 0 }
  validates :height, :numericality => { :greater_than_or_equal_to => 0 }
  validates :width, :numericality => { :greater_than_or_equal_to => 0 }
  
  
  
end
