class Api::V1::BaseController < ActionController::API
  def current_user
    @current_user ||= User.find_by(authentication_token: request.headers['X-User-Token'])
  end
end
