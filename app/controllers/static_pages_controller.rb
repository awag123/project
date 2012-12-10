class StaticPagesController < ApplicationController
  
  def home
	@users = User.paginate(page: params[:page])
  end
  
  
end
