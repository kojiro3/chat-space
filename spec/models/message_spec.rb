require 'rails_helper'

describe Message do
  describe '#create' do

    it 'is valid with a body, image, group_id, user_id' do
      message = build(:message)
      expect(message).to be_valid
    end

    it 'is invalid without a body, image' do
      message = build(:message, body: nil, image: nil)
      message.valid?
      expect(message.errors[:body]).to include("を入力してください")
    end

    it 'is valid with a image although without a body' do
      message = build(:message, body: nil)
      expect(message).to be_valid
    end
  end
end
