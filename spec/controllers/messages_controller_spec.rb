require 'rails_helper'

RSpec.describe MessagesController, type: :controller do
  describe '#index' do
    let!(:messages) { create_list(:message, 3) }

    it 'returns an array of the messages' do
      get :index
      expect(assigns(:messages)).to match_array(messages)
    end
  end

  describe '#show' do
    let!(:message) { create(:message) }

    context 'with the existing message' do
      it 'returns the message' do
        get :show, params: { id: message.id }
        expect(assigns(:message)).to eq(message)
      end
    end

    context 'with no existing message' do
      it 'raises RecordNotFound' do
        expect {
          get :show, params: { id: -1 }
        }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end

  describe '#create' do
    context 'with valid attributes' do
      let(:message_params) { attributes_for(:message).stringify_keys }

      it 'returns new message' do
        post :create, message: message_params
        expect(assigns(:message).attributes.slice('body')).to eq(message_params)
      end

      it 'saves the new message in the database' do
        expect {
          post :create, message: message_params
        }.to change(Message, :count).by(1)
      end
    end

    context 'with invalid attributes' do
      let(:message_params) { attributes_for(:invalid_message) }

      it 'does not save the new message in the database' do
        expect {
          post :create, message: message_params
        }.not_to change(Message, :count)
      end

      it 'raises error' do
        expect {
          post :create, message: message_params
        }.to raise_error
      end
    end
  end
  describe '#destroy'
  describe '#update'
end
