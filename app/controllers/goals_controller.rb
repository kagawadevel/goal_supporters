class GoalsController < ApplicationController
  before_action :set_goal, only: [:show, :edit, :destroy, :update, :finished]
  before_action :authenticate_user!

  def index
    @goals = current_user.goals
  end

  def show
    created = Date.parse(@goal.created_at.to_s)
    @past = (Date.today - created).to_i
    @praised_count = @goal.praises[0].praised
  end

  def new
    @goal = Goal.new(user_id: current_user.id)
  end

  def create
    @goal = Goal.new(goal_params)
    if @goal.save
      Praise.create(goal_id: @goal.id, praised: 0)
      redirect_to @goal, notice: "目標を作成しました"
    else
      render 'new'
    end
  end

  def edit
    if @goal.user.id == current_user.id
    else
      redirect_to @goal, notice: 'そのアクションはできません'
    end
  end

  def update
    before_updated_at = @goal.updated_at
    if @goal.update(goal_params)
      @goal.update(updated_at: before_updated_at)
      redirect_to goal_path(@goal), notice: "目標情報を更新しました"
    else
      render 'edit'
    end
  end

  def destroy
    if @goal.user.id == current_user.id
      @goal.destroy
      redirect_to goals_path
    else
      redirect_to @goal, notice: 'そのアクションはできません'
    end
  end

  def finished
    if @goal.user.id == current_user.id
      if @goal.finished == false
         @goal.update(finished: true, updated_at: @goal.updated_at)
         redirect_to goal_path(@goal), notice: "目標を達成しました！"
      else
        @goal.update(finished: false, updated_at: @goal.updated_at)
        redirect_to goal_path(@goal), notice: "目標を未達成にもどしました"
      end
    else
      redirect_to @goal, notice: 'そのアクションはできません'
    end
  end

  private

  def goal_params
    params.require(:goal).permit(:name, :detail, :user_id)
  end

  def set_goal
    @goal = Goal.find(params[:id])
  end
end
