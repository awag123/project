class Tile < ActiveRecord::Base
  attr_accessible :x_location, :y_location
  
  has_one :board, through: :advertisement
  belongs_to :advertisement
  
  validates_numericality_of :x_location, presence: true, :greater_than_or_equal_to => 0
  validates_numericality_of :y_location, presence: true, :greater_than_or_equal_to => 0
  validates_numericality_of :cost, :greater_than_or_equal_to => 0 
  
  validate :check_location

  
  def age
	#lower price by half till $.01
  end
  
  private
  
  def check_location
	unless x_location.nil?
		if self.x_location < advertisement.x_location
			errors.add(:x_location, 'x location smaller then avertisement x location')
		end
		if (advertisement.x_location + advertisement.width - 1) < self.x_location
			errors.add(:x_location, 'x location greater then avertisement x location + width')
		end
		if self.x_location >= board.width
			errors.add(:x_location, 'x location greater then board width')
		end
		if self.x_location > advertisement.width
			errors.add(:x_location, 'x location greater then advertisement width')
		end
	end
	unless y_location.nil?
		if self.y_location < advertisement.y_location
			errors.add(:y_location, 'y location smaller then avertisement y location')
		end
		if (advertisement.y_location + advertisement.height - 1) < self.y_location
			errors.add(:y_location, 'y location greater then avertisement y location + height')
		end
		if self.y_location >= board.height
			errors.add(:x_location, 'y location greater then board height')
		end
		if self.y_location > advertisement.height
			errors.add(:x_location, 'y location greater then advertisement height')
		end
	end
  end
	
end
