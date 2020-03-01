class BoardsController < ApplicationController
  before_action :set_board, only: [:show, :edit, :destroy, :update]
  before_action :authenticate_user!

  def index
    @boards = Board.all
  end

  def show
  end

  def new
    @board = Board.new(group_id: params[:group_id])
  end

  def create
    @board = Board.new(board_params)
    if @board.save
      redirect_to group_path(@board.group_id), notice: "報告しました"
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @board.update(board_params)
      redirect_to board_path(@board), notice: "削除しました"
    else
      render 'edit'
    end
  end

  def destroy
    @board.destroy
    redirect_to group_path(@board.group_id), notice: "削除しました"
  end

  private

  def board_params
    params.require(:board).permit(:title, :detail, :group_id)
  end

  def set_board
    @board = Board.find(params[:id])
  end
end
