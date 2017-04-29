class GroupsController < ApplicationController

  def new
  end

  def create
    binding.pry
    params = { group: {
      name: group_params[:name], group_users_attributes: [
        { user_id: current_user.id }
      ]
    }}
    Group.create(params[:group])
    redirect_to root_path
  end

  private
  def group_params
    params.permit(:name)
  end

end
