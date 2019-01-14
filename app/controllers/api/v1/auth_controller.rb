class Api::V1::AuthController < ApplicationController

   skip_before_action :authorized, only: [:create]

  def create
    @user = User.find_by(parent_email: logged_in_params[:parent_email])

    if @user && @user.authenticate(logged_in_params[:password])
      @token = issue_token({user_id: @user.id}, 'SECRET')
      render json: {jwt: @token, parent_email: @user.parent_email, child_username: @user.child_username, avatar: @user.avatar}
    else
      render json: {error: ''}, status: 400
    end
  end

  def show
    id = decode_token['user_id']

    @user = User.find(id)

    if @user
      render json: { parent_email: @user.parent_email, child_username: @user.child_username, avatar: @user.avatar}, status: 200
   else
     render json: {error: 'error occured'}, status: 422
   end
  end


  private
  def logged_in_params
    params.require(:user).permit(:parent_email, :password)
  end

end
