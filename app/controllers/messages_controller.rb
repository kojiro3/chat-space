class MessagesController < ApplicationController

  def index
    @group = Group.find(params[:group_id])
    @groups = current_user.groups
    @message = Message.new
    @messages = @group.messages
    @users = @group.users
  end

  def create
    a_message_params = {}
    @message = Message.new(message_params(a_message_params))
    if @message.save
      redirect_to group_messages_path, notice: 'メッセージ送信成功'
    else
      flash.now[:alert] = 'メッセージ送信失敗'
      render :index
    end
  end

  private

  def message_params(a_message_params)
    a_message_params[:body] = params.require(:message).permit(:body)[:body]
    a_message_params[:group_id] = params.permit(:group_id)[:group_id]
    a_message_params[:user_id] = current_user.id
    return a_message_params
  end
end
