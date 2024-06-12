class AuthController < ApplicationController
  def login
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      token = encode_token(user_id: user.id)
      render json: { token: token, user: { id: user.id, email: user.email } }
    else
      render json: { error: "Invalid email or password" }, status: :unauthorized
    end
  end

  private

  def encode_token(payload)
    JWT.encode(payload, 'your_secret_key')
  end
end
