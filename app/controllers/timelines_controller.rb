class TimelinesController < ApplicationController
  before_action :set_timeline, only: [:show, :edit, :destroy, :update]
  before_action :authenticate_user!
  before_action :timeline_group_joined?, only: %i[create update]
  before_action :timeline_group_joined2?, only: %i[edit destroy]

  def index
    @timelines = Timeline.where('updated_at >= ?', 3.day.ago)
  end

  def show
  end

  def new
    group = Group.find_by(id: params[:group_id])
      if group.users.where(id: current_user.id).present?
        if current_user.goals.present?
          @timeline = Timeline.new(group_id: params[:group_id])
          @my_goals = current_user.goals.where(informed: 0)or(current_user.goals.where('updated_at < ?', Time.zone.now.yesterday))
          if @my_goals.present?
            @my_goals
          else
            redirect_to group_path(@timeline.group_id), notice: "全ての目標が２４時間以内に報告済みです"
          end
        else
          flash[:notice] = '目標をひとつも登録していません'
          redirect_to group
        end
      else
        flash[:notice] = 'グループに参加していなければそのアクションはできません'
        redirect_to group, danger: 'グループに参加していなければそのアクションはできません'
      end
  end

  def create
    @timeline = Timeline.new(timeline_params)
    my_goal = @timeline.goal
    now = Time.now
    if my_goal.updated_at.tomorrow < now || my_goal.created_at == my_goal.updated_at
      if @timeline.save
        my_goal.update(informed: my_goal.informed + 1)
        redirect_to group_path(@timeline.group_id), notice: "報告しました"
      else
        flash[:notice] = '本文が空欄です'
        redirect_to new_timeline_path(group_id: @timeline.group.id, user_id: current_user.id)
      end
    else
      redirect_to group_path(@timeline.group_id), notice: "その目標は前回の報告からまだ２４時間が経過していません"
    end
  end

  def edit
    @my_goals= current_user.goals
  end

  def update
    if @timeline.update(timeline_params)
      redirect_to group_path(@timeline.group_id), notice: "投稿を編集しました"
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

  def timeline_group_joined?
    group = Group.find_by(id: params[:timeline][:group_id])
    if group.users.where(id: current_user.id).present?
    else
      flash[:notice] = 'グループに参加していなければそのアクションはできません'
      redirect_to group, danger: 'グループに参加していなければそのアクションはできません'
    end
  end

  def timeline_group_joined2?
    group = Group.find_by(id: params[:group_id])
    if group.users.where(id: current_user.id).present?
    else
      flash[:notice] = 'グループに参加していなければそのアクションはできません'
      redirect_to group, danger: 'グループに参加していなければそのアクションはできません'
    end
  end
end
