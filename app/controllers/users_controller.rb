class UsersController < ApplicationController
  def create
    user = User.new(user_params)
    if user.save
      render json: {message: "User Created Successfully"}, status: :created
    else
      render json: {error: user.error.full_message}, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.permit(:username, :password, :password_confirmation)
  end
end
