class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :destroy, :update]

  def index
  end

  def show
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to @group, notice: "ユーザーを作成しました"
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @group.update(group_params)
      redirect_to group_path(@group), notice: "ユーザー情報を更新しました"
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
    params.require(:group).permit(:name, :introduce)
  end

  def set_group
    @group = Group.find(params[:id])
  end
end
