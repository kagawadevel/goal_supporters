class PraisesController < ApplicationController
  before_action :authenticate_user!
  before_action :group_joined?, only: %i[update]


  def update
    my_praised = Praise.find_by(goal_id: params[:id])
    if my_praised.goal.user.id == current_user.id
      redirect_to group_path(params[:group_id]), flash: { danger: '自分の目標に対してはできません' }
    else
      my_praised.update(praised: my_praised.praised + 1)
      my_timeline = Timeline.find_by(id: params[:timeline_id])
      before_time = my_timeline.updated_at
      my_timeline.update(cheered: true)
      my_timeline.update(updated_at: before_time)
      redirect_to group_path(params[:group_id]), flash:  { notice: 'いいね！しました' }
    end
  end
end
