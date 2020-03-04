class UserGroupRelationsController < ApplicationController
  before_action :authenticate_user!

  def index

  end

  def create
    join = current_user.user_group_relations.create(group_id: params[:group_id])
    redirect_to join.group, flash: { notice: "#{join.group.name}に参加しました"}
  end

  def destroy
    exited = current_user.user_group_relations.find(params[:joined_id]).destroy
    redirect_to exited.group, flash: { notice: "#{exited.group.name}から抜けました"}
  end
end
