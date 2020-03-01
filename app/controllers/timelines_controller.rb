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
  end

  def create
    @timeline = Timeline.new(timeline_params)
    if @timeline.save
      redirect_to group_path(@timeline.group_id), notice: "報告しました"
    else
      render 'new'
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
    params.require(:timeline).permit(:content, :group_id, :user_id)
  end

  def set_timeline
    @timeline = Timeline.find(params[:id])
  end
end
