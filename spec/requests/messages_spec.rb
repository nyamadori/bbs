require 'rails_helper'

RSpec.describe 'Messages', type: :request do
  shared_examples_for 'RecordInvalid error' do
    let(:message_params) { attributes_for(:invalid_message) }

    it 'raises RecordInvalid error' do
      expect {
        post '/messages', params: { message: message_params }
      }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end

  shared_examples_for 'RecordNotFound error' do
    let(:message_id) { 0 }

    context 'with no exisiting item' do
      it 'raises RecordNotFound error' do
        expect { do_request }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end

  describe 'GET /messages' do
    let!(:messages) { create_list(:message, 3) }

    it 'assigns an array of the messages to @messages' do
      get '/messages'
      expect(assigns(:messages)).to match_array(messages)
    end

    it 'returns an array of the messages' do
      get '/messages'
      res = JSON.parse(response.body)
      expect(res).to be_kind_of(Array)
      expect(res.size).to eq(3)
    end
  end

  describe 'POST /messages/' do
    def do_request
      post '/messages', params: { message: message_params }
    end

    context 'with valid attributes' do
      let(:message_params) { attributes_for(:message).stringify_keys }

      it 'returns new message' do
        do_request
        expect(assigns(:message).attributes).to include(message_params)
      end

      it 'saves the new message in the database' do
        expect { do_request }.to change(Message, :count).by(1)
      end
    end

    it_behaves_like 'RecordInvalid error' do
      let(:message_param) { attributes_for(:message, body: '') }
    end
  end

  describe 'GET /messages/:id' do
    let!(:message) { create(:message) }
    let(:message_id) { message.id }

    def do_request
      get "/messages/#{message_id}"
    end

    context 'with the existing message' do
      it 'returns the message' do
        do_request
        expect(assigns(:message)).to eq(message)
      end
    end

    context 'with no existing message' do
      it_behaves_like 'RecordNotFound error'
    end
  end

  describe 'PATCH /messages/:id' do
    let!(:message) { create(:message) }
    let(:message_id) { message.id }
    let(:message_param) { attributes_for(:message) }

    def do_request
      patch "/messages/#{message_id}", params: { message: message_param }
    end

    context 'with valid attributes' do
      let(:message_param) { attributes_for(:message, body: 'new body') }

      it 'updates the body of message' do
        expect { do_request }.to change { message.reload.body }.to('new body')
      end
    end

    it_behaves_like 'RecordInvalid error' do
      let(:message_param) { attributes_for(:message, body: '') }
    end

    it_behaves_like 'RecordNotFound error'
  end

  describe '#destroy' do
    let!(:message) { create(:message) }
    let(:message_id) { message.id }
    let(:message_param) { attributes_for(:message) }

    def do_request
      delete "/messages/#{message_id}"
    end

    context 'with the exisiting message' do
      it 'deletes the message in the database' do
        expect { do_request }.to change(Message, :count).by(-1)
      end
    end

    it_behaves_like 'RecordNotFound error'
  end
end
