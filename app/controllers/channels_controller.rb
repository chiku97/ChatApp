class ChannelsController < ApplicationController

  before_action :authorize_request

  def index
    channels = Channel.all
    render json: {channels: channels}
  end

  def create
    channel  = Channel.new(channel_params)
    if channel.save
      render json: channel, status: :created
    else
      render json: {errors: channel.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def show
    channel = Channel.find(params[:id])
    render json: channel, include: :messages
  end


  private

  def channel_params
    params.permit(:name, :desc)
  end
end
