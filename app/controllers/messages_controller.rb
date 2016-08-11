class MessagesController < ApplicationController
  before_action :set_message, except: [:index, :create]

  def index
    @messages = Message.all
    render json: @messages
  end

  def show
    render json: @message
  end

  def create
    @message = Message.new(message_params)
    @message.save!
  end

  def destroy
    @message.destroy
  end

  def update
    @message.update!(message_params)
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end

  def set_message
    @message = Message.find(params[:id])
  end
end
