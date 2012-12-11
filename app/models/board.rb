class Board < ActiveRecord::Base
  attr_accessible :height, :name, :timezone, :width
  
  has_many :tiles, through: :advertisements
  has_many :advertisements
  belongs_to :user
  has_one :payment_detail, as: :payable
  
  
  validates :name, presence: true
  validates :width, :numericality => { :greater_than_or_equal_to => 1 }
  validates :height, :numericality => { :greater_than_or_equal_to => 1 }
  validates_inclusion_of :timezone, :in => ActiveSupport::TimeZone.zones_map { |m| m.name }, :message => "is not a valid Time Zone"
  
  after_save :initialize_board

  def age
	#go through all tilles and call tile.age
  end
  
  private
  
  def initialize_board
	default_ad = Rails.root.join('spec', 'images', '3x5.jpg').to_s
	@ad = advertisements.build(:height => height, :width => width, :x_location => 0, :y_location => 0)
	@ad.user = user
	@ad.image_contents=(default_ad)

	@ad.save
  end
  
  
end
