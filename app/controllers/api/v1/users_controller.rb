class Api::V1::UsersController < Api::V1::BaseController
  def index
    users = User.all
    respond_to do |format|
      format.html
      format.json { render json: users }
    end
  end
end
