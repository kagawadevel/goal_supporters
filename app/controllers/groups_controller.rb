class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :destroy, :update]
  before_action :authenticate_user!
  before_action :group_owner?, only: %i[edit update destroy]

  def index
    @q = Group.ransack(params[:q])
    @searched_groups = @q.result(distinct: true).page(params[:page]).per(3)
  end

  def show
    @timelines = Timeline.where(group_id: @group.id).where('updated_at >= ?', 3.day.ago)
    @boards = Board.where(group_id: @group.id)
    @join = UserGroupRelation.find_by(user_id: current_user.id, group_id: params[:id])
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save!
      current_user.user_group_relations.create(group_id: @group.id)
      redirect_to @group, notice: "グループを作成しました"
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @group.update(group_params)
      redirect_to group_path(@group), notice: "グループ情報を更新しました"
    else
      render 'edit'
    end
  end

  def destroy
    @group.destroy
    redirect_to new_group_path
  end

  private

  def group_params
    params.require(:group).permit(:name, :introduce, :owner_id)
  end

  def set_group
    @group = Group.find(params[:id])
  end

  def group_owner?
    if @group.owner_id == current_user.id
    else
      redirect_to @group, notice: 'グループ作成者でないとその操作はできません'
    end
  end

end
