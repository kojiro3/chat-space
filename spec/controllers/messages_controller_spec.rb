require 'rails_helper'

describe MessagesController, type: :controller do
  let(:user) { create(:user) }

  describe 'GET #index' do
    before do
      login_user user
    end

    it 'assigns the requested groups to @groups' do
      @group = user.groups.first
      get :index, params: { group_id: @group.id }
      groups = user.groups
      expect(assigns(:groups)).to match(groups)
    end

    it 'assigns the requested messages to @messages' do
      @group = user.groups.first
      get :index, params: { group_id: @group.id }
      messages = @group.messages
      expect(assigns(:messages)).to match(messages)
    end

    it 'renders the :index template' do
      @group = user.groups.first
      get :index, params: { group_id: @group.id }
      expect(response).to render_template :index
    end
  end
end
