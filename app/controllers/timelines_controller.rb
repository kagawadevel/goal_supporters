class TimelinesController < ApplicationController
  before_action :set_timeline, only: [:show, :edit, :destroy, :update]
  before_action :authenticate_user!

  def index
    @timelines = Timeline.all
  end

  def show
  end

  def new
    @timeline = Timeline.new(group_id: params[:group_id])
    @my_goals= current_user.goals
  end

  def create
    @timeline = Timeline.new(timeline_params)
    my_goal = @timeline.goal
    now = Time.now
    if my_goal.updated_at.tomorrow < now
      if @timeline.save
        my_goal.update(informed: my_goal.informed + 1)
        redirect_to group_path(@timeline.group_id), notice: "報告しました"
      else

      end
    else
      redirect_to group_path(@timeline.group_id), notice: "その目標は前回の報告からまだ２４時間が経過していません"
    end
  end

  def edit
  end

  def update
    if @timeline.update(timeline_params)
      redirect_to group_path(@timeline.group_id), notice: "削除しました"
    else
      render 'edit'
    end
  end

  def destroy
    @timeline.destroy
    redirect_to group_path(@timeline.group_id), notice: "削除しました"
  end

  private

  def timeline_params
    params.require(:timeline).permit(:content, :group_id, :user_id, :goal_id)
  end

  def set_timeline
    @timeline = Timeline.find(params[:id])
  end
end
