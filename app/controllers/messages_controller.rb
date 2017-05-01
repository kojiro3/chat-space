class MessagesController < ApplicationController

before_action :move_to_registraion

  def index
    @group = Group.find(params[:group_id])
    @groups = current_user.groups
  end

  private
  
  def move_to_registraion
    redirect_to new_user_registration_path unless user_signed_in?
  end

end
