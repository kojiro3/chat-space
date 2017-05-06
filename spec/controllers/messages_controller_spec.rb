require 'rails_helper'

describe MessagesController, type: :controller do
  let(:user) { create(:user) }
  let(:message) { create(:message, user: user, group: user.groups.first) }

  describe 'GET #index' do
    before do
      login_user user
      @group = user.groups.first
      get :index, params: { group_id: @group.id }
    end

    it 'assigns all groups to @groups' do
      groups = user.groups
      expect(assigns(:groups)).to match(groups)
    end

    it 'assigns all messages to @messages' do
      messages = @group.messages
      expect(assigns(:messages)).to match(messages)
    end

    it 'renders the :index template' do
      expect(response).to render_template :index
    end
  end

  describe 'POST #create' do
    before do
      login_user user
      @group = user.groups.first
    end
    
    context 'with valid params' do
      let(:params) {{ message: attributes_for(:message, { body: 'hello' }), group_id: @group.id}}
      it 'creates a new Message' do
        expect{
          post :create, params: params
        }.to change(Message, :count).by(1)
      end

      it 'assigns a newly created message as @message' do
        post :create, params: params
        expect(assigns(:message)).to be_a(Message)
        expect(assigns(:message)).to be_persisted
      end

      it 'redirects to the :index template' do
        post :create, params: params
        expect(response).to redirect_to(action: :index)
      end
    end

    context 'with invalid params' do
      let(:params) {{ message: attributes_for(:message, { body: '', image: '' }), group_id: @group.id}}
      it 'assigns a newly created but unsaged message as @message' do
        post :create, params: params
        expect(assigns(:message)).to be_a_new(Message)
        expect(assigns(:message)).not_to be_persisted
      end

      it 're-renders the :index template' do
        post :create, params: params
        expect(response).to render_template :index
      end
    end
  end
end
