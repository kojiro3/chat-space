class MessagesController < ApplicationController

  before_action :set_instance, only: [:index, :create]

  def index; end

  def create
    @message = current_user.messages.new(message_params)
    if @message.save
      redirect_to group_messages_path, notice: 'メッセージ送信成功'
    else
      flash.now[:alert] = "#{@message.errors.full_messages}"
      render :index
    end
  end

  private

  def message_params
    params.require(:message).permit(:body, :image).merge(group_id: params[:group_id])
  end

  def set_instance
    @group = Group.find(params[:group_id])
    @groups = current_user.groups
    @message = Message.new
    @messages = @group.messages
    @users = @group.users
  end
end
