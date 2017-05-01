class MessagesController < ApplicationController

  def index
    if params[:group_id]
      @group = Group.find(params[:group_id])
    end
    @groups = current_user.groups
  end
end
