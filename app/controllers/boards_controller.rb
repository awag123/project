class BoardsController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy]
  before_filter :correct_user,   only: :destroy
  
  def create
	if !signed_in?
		redirect_to root_path
	else
		@board = current_user.boards.create(params[:board])
		if @board.save
		  flash[:success] = "Board created!"
		  redirect_to board_show_path
		else
		  flash.now[:error] = "Board was not created..."
		  redirect_to root_path
		end
	end
  end
  
  def show
	@board = Board.find(params[:id])
	current_board=(@board)
	@user = @board.user
  end
  
  def destroy
	Board.find(params[:id]).destroy
	flash[:success] = "Board destroyed."
	redirect_to root_url
  end
  
  def new
  	if !signed_in?
		redirect_to root_url
		flash[:error] = "Not signed in"
	end
	@user = current_user
	@board  = current_user.boards.build
  end
  
  def index
    @boards = Board.paginate(page: params[:page])
  end

  private

    def correct_user
      @board = current_user.boards.find_by_id(params[:id])
      redirect_to root_url if @board.nil?
    end
end
