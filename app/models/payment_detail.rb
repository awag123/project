class PaymentDetail < ActiveRecord::Base
  attr_accessible :amount
  
  belongs_to :payable, polymorphic: true
  belongs_to :user
  
  validates :amount, presence: true, numericality: true
  
  def charge
	#compiles charges for all of the user's advertisements
  end
end
