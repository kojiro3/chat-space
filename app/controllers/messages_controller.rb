class MessagesController < ApplicationController

  def index
    @group = Group.find(params[:group_id])
    @group_users = current_user.group_users
  end

end
