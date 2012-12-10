class AdvertisementsController < ApplicationController
  def new
	@user = current_user
	@advertisement  = current_user.advertisements.build
	@board = Board.find(params[:board_id])
  end
  
  def create
	@board = Board.find(params[:board_id])
    @advertisement = @board.advertisements.create(params[:advertisement])
	@advertisement.user = current_user
    if @advertisement.save
      flash[:success] = "Advertisement created!"
      redirect_to root_url
	else
	  flash.now[:error] = "Advertisement was not created..."
      redirect_to root_url
    end
  end
  

end
