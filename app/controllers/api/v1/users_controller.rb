class Api::V1::UsersController < ApplicationController

  def create
    @user = User.create(user_params)
    if @user.valid?
      # UserMailer.welcome_email(@user).deliver_now
      token = JWT.encode({user_id: @user.id}, 'SECRET')
      render json: {user: @user, jwt: token}
    else
      render json: {error: "Something is wrong"}, status: 422
    end
  end

  private
  def user_params
    params.require(:user).permit(:parent_email, :password, :parent_name, :child_username)
  end
end
