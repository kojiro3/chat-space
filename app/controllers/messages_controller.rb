class MessagesController < ApplicationController

  def index
    @group = Group.find(params[:group_id])
    @groups = current_user.groups
    @message = Message.new
  end

  def create
    @message = Message.new(body: message_params[:body], group_id: params[:group_id], user_id: current_user.id)
    if @message.save
      redirect_to group_messages_path, notice: 'メッセージ送信成功'
    else
      flash.now[:alert] = 'メッセージ送信失敗'
      render :index
    end
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end
end
