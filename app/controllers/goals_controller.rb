class GoalsController < ApplicationController
  before_action :set_goal, only: [:show, :edit, :destroy, :update]
  before_action :authenticate_user!

  def index
    @goals = Goal.all
  end

  def show
  end

  def new
    @goal = Goal.new
  end

  def create
    @goal = Goal.new(goal_params)
    if @goal.save
      redirect_to @goal, notice: "ユーザーを作成しました"
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @goal.update(goal_params)
      redirect_to goal_path(@goal), notice: "ユーザー情報を更新しました"
    else
      render 'edit'
    end
  end

  def destroy
    @goal.destroy
    redirect_to goals_path
  end

  private

  def goal_params
    params.require(:goal).permit(:name, :detail)
  end

  def set_goal
    @goal = Goal.find(params[:id])
  end
end
