class SessionController < ApplicationController
  def show_current_user
    @current_user = current_user
    render json: @current_user
  end
end
