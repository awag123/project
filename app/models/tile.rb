class Tile < ActiveRecord::Base
  attr_accessible :x_location, :y_location
  
  belongs_to :board
  belongs_to :advertisement
end
