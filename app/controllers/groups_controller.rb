class GroupsController < ApplicationController

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if before_save
    @group.save
    GroupUser.create(group_id: @group.id, user_id: current_user.id)
      redirect_to root_path
    end
  end

  private
  def group_params
    params.require(:group).permit(:name)
  end

  def before_save
    if @group.name?
      return true
    end
  end

end
