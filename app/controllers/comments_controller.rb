class CommentsController < ApplicationController
  before_action :set_comment, only: [:destroy]
  before_action :authenticate_user!
  before_action :comment_group_joined?, only: %i[create]
  before_action :comment_group_joined2?, only: %i[destroy]

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to board_path(@comment.board, board_id: @comment.board.id, group_id: @comment.group.id, user_id: @comment.user_id), notice: "コメントを投稿しました"
    else
      flash[:error_messages] = @comment.errors.full_messages
      @comments = Comment.where(board_id: params[:comment][:board_id])
      @board = Board.find(params[:comment][:board_id])
      @comment.update(content: "")
      redirect_to board_path(@comment.board, board_id: @comment.board.id, group_id: @comment.group.id, user_id: @comment.user_id)
    end
  end

  def destroy
    if @comment.user_id == current_user.id
      @comment.destroy
      redirect_to board_path(@comment.board, board_id: @comment.board.id, group_id: @comment.group.id, user_id: current_user.id), notice: "削除しました"
    else
      board = Board.find_by(id: params[:board_id])
      redirect_to board_path(@comment.board, board_id: @comment.board.id, group_id: @comment.group.id, user_id: current_user.id), notice: 'コメント投稿者でないと削除できません'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :group_id, :board_id, :user_id)
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_group_joined?
    group = Group.find_by(id: params[:comment][:group_id])
    if group.users.where(id: current_user.id).present?
    else
      flash[:notice] = 'グループに参加していなければそのアクションはできません'
      redirect_to group, danger: 'グループに参加していなければそのアクションはできません'
    end
  end

  def comment_group_joined2?
    group = Group.find_by(id: params[:group_id])
    if group.users.where(id: current_user.id).present?
    else
      flash[:notice] = 'グループに参加していなければそのアクションはできません'
      redirect_to group, danger: 'グループに参加していなければそのアクションはできません'
    end
  end

end
