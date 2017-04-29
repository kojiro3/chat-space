class GroupsController < ApplicationController

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      GroupUser.create(group_id: @group.id, user_id: current_user.id)
      redirect_to root_path, notice: 'グループを作成しました'
    else
      flash.now[:alert] = 'グループの作成に失敗しました'
      render :new
    end
  end

  private

  def group_params
    params.require(:group).permit(:name)
  end
end
