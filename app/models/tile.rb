class Tile < ActiveRecord::Base
  attr_accessible :x_location, :y_location
  
  has_one :board, through: :advertisement
  belongs_to :advertisement
end
