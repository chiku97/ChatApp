class MessagesController < ApplicationController
  before_action :authorize_request

  def index
    channel = Channel.find(params[:channel_id])
    messages = channel.messages
    render json: messages, include: user
  end

  def create
    channel = Channel.find(params[:channel_id])
    message = channel.message.build(message_params)
    message.user = @current_user
    if message.save
      ActionCable.server.broadcast "channel_#{channel.id}", message: render_message(message)
      render json: message, status: :created
    else
      render json: {errors: message.errors.full_messages}, status: :unprocessable_entity
    end
  end

  private

  def message_params
    paramsrequire(:message).permit(:content)
  end

  def render_message(message)
    ApplicationController.renderer.render(partial: 'messages/message', locals: {message: message})
  end
end
