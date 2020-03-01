class BoardsController < ApplicationController
  before_action :set_board, only: [:show, :edit, :destroy, :update]
  before_action :authenticate_board!

  def index
  end

  def show
  end

  def new
    @board = Board.new
  end

  def create
    @board = Board.new(board_params)
    if @board.save
      redirect_to @board, notice: "ユーザーを作成しました"
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @board.update(board_params)
      redirect_to board_path(@board), notice: "ユーザー情報を更新しました"
    else
      render 'edit'
    end
  end

  def destroy
    @board.destroy
    redirect_to new_board_path
  end

  private

  def board_params
    params.require(:board).permit(:name, :email, :password, :password_confirmation)
  end

  def set_board
    @board = Board.find(params[:id])
  end
end
