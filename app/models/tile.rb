class Tile < ActiveRecord::Base
  attr_accessible :x_location, :y_location
  
  has_one :board, through: :advertisement
  belongs_to :advertisement
  
  
  validates :x_location, presence: true, :numericality => { :greater_than_or_equal_to => 0 }
  validates :y_location, :numericality => { :greater_than_or_equal_to => 0 }
  validates :cost, :numericality => { :greater_than_or_equal_to => 0 }
  
  validate :x_location_ad_tile
  
  
 private 
	
  def x_location_ad_tile
	advertisement.x_location >= x_location
  end
	
end
