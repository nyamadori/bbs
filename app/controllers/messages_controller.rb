class MessagesController < APIController
  def index
    # TODO
    # メッセージ一覧取得 (JSON)
    render json: Message.all
  end

  def show
    render json: Message.find(params[:id])
  end

  def create
    # TODO
    # メッセージ投稿
  end

  def destroy
    # TODO
    # メッセージ削除
  end

  def update
    # TODO
    # メッセージ編集
  end
end
