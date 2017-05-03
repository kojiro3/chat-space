class MessagesController < ApplicationController

  def index
    @group = Group.find(params[:group_id])
    @groups = current_user.groups
    @message = Message.new
    @messages = @group.messages
    @users = @group.users
  end

  def create
    @message = current_user.messages.new(message_params)
    if @message.save
      redirect_to group_messages_path, notice: 'メッセージ送信成功'
    else
      # flash.now[:alert] = 'メッセージ送信失敗'
      # render :index
      redirect_to group_messages_path, notice: "#{@message.errors.full_messages}"
    end
  end

  private

  def message_params
    params.require(:message).permit(:body).merge(group_id: params[:group_id])
  end
end
