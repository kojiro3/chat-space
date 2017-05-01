class GroupsController < ApplicationController

before_action :find_group, only: [:edit, :update]

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to group_messages_path(@group), notice: 'グループを作成しました'
    else
      flash.now[:alert] = 'グループの作成に失敗しました'
      render :new
    end
  end

  def edit
  end

  def update
    @group.name = group_params[:name]
    if @group.save
      redirect_to group_messages_path(@group), notice: 'グループを編集しました'
    else
      flash.now[:alert] = 'グループの編集に失敗しました'
      render :edit
    end
  end

  private

  def group_params
    params.require(:group).permit(:name)
  end

  def find_group
    @group = Group.find(params[:id])
  end
end
