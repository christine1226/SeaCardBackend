class Api::V1::UsersController < ApplicationController

   skip_before_action :authorized, only: [:create, :index, :progress, :update]

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      UserMailer.welcome_email(@user).deliver_now
      token = JWT.encode({user_id: @user.id}, 'SECRET')
      render json: {user: @user.parent_email, child_username: @user.child_username, jwt: token, avatar: @user.avatar}
    else
      render json: {error: "Something is wrong"}, status: 422
    end
  end

  def progress
    @user = User.find_by(params[:user_id])
    all = @user.scores.map{|score| score.activity_id}
    @activity = Activity.find_by(id: all)
    if @user_scores = @user.scores
      render json: {score: @user_scores}
    else
      render json: {error: "Something is wrong"}, status: 422
    end
  end

  def update
    id = decode_token['user_id']
    @user = User.find(id)
    @user.update(user_params)

    render json: {avatar: @user.avatar}
  end

  private
  def user_params
    params.require(:user).permit(:parent_email, :password, :parent_name, :child_username, :avatar)
  end
end
