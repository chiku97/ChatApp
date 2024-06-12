module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = find_verified_user
    end

    protected

    def find_verified_user
      if(token = request.params[:token])
        user_id = JWT.decode(token, 'your_secret_key')[0]['user_id']
        User.find_by(id: user_id)
      else
        reject_unauthorized_connection
      end
    end
  end
end
