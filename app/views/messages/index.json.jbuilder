if params[:last_id]
  json.array! @messages do |message|
    json.body message.body
    json.name message.user.name
    json.created_at message.created_at.strftime('%Y/%m/%d %H:%M:%S')
    json.image message.image
    json.id message.id
  end
else
  json.id @message.id
end
