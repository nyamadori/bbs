class MessagesController < APIController
  before_action set_message, except: [:index, :create]

  def index
    render json: Message.all
  end

  def show
    render json: @message
  end

  def create
    @message = Message.new(message_params)
    @message.save
  end

  def destroy
    @message.destroy
  end

  def update
    @messag.update(message_params)
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end

  def set_message
    @message = Message.find(params[:id])
  end
end
