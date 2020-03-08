class BoardsController < ApplicationController
  before_action :set_board, only: [:show, :edit, :destroy, :update]
  before_action :authenticate_user!
  before_action :group_joined?, only: %i[new]
  before_action :board_group_joined?, only: %i[create]

  def index
    @boards = Board.all
  end

  def show
    @comment = Comment.new(board_id: params[:board_id], group_id: params[:group_id], user_id: params[:user_id])
    @comments = Comment.where(board_id: @board.id)
  end

  def new
    @board = Board.new(group_id: params[:group_id])
  end

  def create
    @board = Board.new(board_params)
    if @board.save
      redirect_to group_path(@board.group_id), notice: "掲示板を作成しました"
    else
      render 'new'
    end
  end

  def edit
    group = @board.group
    if group.users.where(id: current_user.id).present?
    else
      flash[:notice] = 'グループに参加していなければそのアクションはできません'
      redirect_to group, danger: 'グループに参加していなければそのアクションはできません'
    end
  end

  def update
    if @board.update(board_params)
      redirect_to board_path(@board), notice: "グループを編集しました"
    else
      render 'edit'
    end
  end

  def destroy
    group = @board.group
    if group.users.where(id: current_user.id).present?
      @board.destroy
      redirect_to group_path(@board.group_id), notice: "削除しました"
    else
      flash[:notice] = 'グループに参加していなければそのアクションはできません'
      redirect_to group, danger: 'グループに参加していなければそのアクションはできません'
    end
  end

  private

  def board_params
    params.require(:board).permit(:title, :detail, :group_id)
  end

  def set_board
    @board = Board.find(params[:id])
  end

  def board_group_joined?
    group = Group.find_by(id: params[:board][:group_id])
    if group.users.where(id: current_user.id).present?
    else
      redirect_to group, notice: 'グループに参加していなければそのアクションはできません'
    end
  end
end
