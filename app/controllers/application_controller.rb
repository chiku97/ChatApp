class ApplicationController < ActionController::API
  include ExceptionHandler

  # before_action :authorize_request

  attr_reader :current_user

  private

  def authorize_request
    @current_user = AuthorizeRequest.new(request.headers).call
  end
end
