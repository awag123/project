class AdvertisementsController < ApplicationController
  def new
	@user = current_user
	@board = Board.find(params[:board_id])
	@advertisement  = @board.advertisements.build
  end
  
  def create
	@board = Board.find(params[:board_id])
    @advertisement = @board.advertisements.create(params[:advertisement])
    if @advertisement.save
      flash[:success] = "Advertisement created!"
      redirect_to root_url
	else
	  flash.now[:error] = "Advertisement was not created..."
      redirect_to root_url
    end
  end
  
  def show
	@ad = Advertisement.find(params[:id])
	send_data(@ad.image)
  end
  

end
