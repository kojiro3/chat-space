class UsersController < ApplicationController

  def search
    @users = User.where('name LIKE(?)',"#{ params[:keyword] }%").where.not(id: current_user.id)
    render json: @users
  end
end
