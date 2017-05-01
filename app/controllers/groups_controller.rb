class GroupsController < ApplicationController

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
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
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
end
