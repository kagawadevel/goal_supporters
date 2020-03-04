class CommentsController < ApplicationController
  before_action :set_comment, only: [:destroy]
  before_action :authenticate_user!

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to board_path(@comment.board, board_id: @comment.board.id, group_id: @comment.group.id), notice: "コメントを投稿しました"
    else
      flash[:danger] = "投稿に失敗しました"
      render 'boards/show'

      失敗した場合を要修正
    end
  end

  def destroy
    @comment.destroy
    redirect_to @comment.board, notice: "削除しました"
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :group_id, :board_id)
  end

  def set_comment
    @comment = comment.find(params[:id])
  end
end
