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
  
  validate :check_size
  
  
  def image_contents=
	#no clue
  end
  
  def charge
	#computes total charge for advertisement by getting price of all tiles
  end
  
  private
  
  def check_size
	unless x_location.nil?
		if self.x_location > (board.width - 1)
			errors.add(:x_location, 'x location greater then board width')
		end
		if self.width > board.width
			errors.add(:x_location, 'width greater then board width')
		end
		if (self.width + self.x_location) > board.width
			errors.add(:x_location, 'x location + width greater then board height')
		end
	end
	unless y_location.nil?
		if self.y_location > (board.height - 1)
			errors.add(:y_location, 'y location greater then board height')
		end
		if self.height > board.height
			errors.add(:y_location, 'height greater then board height')
		end
		if (self.height + self.y_location) > board.height
			errors.add(:y_location, 'y location + height greater then board height')
		end
	end
  end
  
  
  
  
  
end
