class PraisesController < ApplicationController
  before_action :authenticate_user!


  def update
    my_praised = Praise.find_by(goal_id: params[:id])
    if my_praised.goal.user.id == current_user.id
      redirect_to group_path(params[:group_id]), flash: { danger: '自分の目標に対してはできません' }
    else
      if my_praised.update_at
      my_praised.update(praised: my_praised.praised + 1)
      redirect_to group_path(params[:group_id]), flash:  { notice: 'いいね！しました' }
    end
  end
end
