class Api::V1::AuthController < ApplicationController

  def create
    user = User.find_by(parent_email: logged_in_params[:parent_email])
    if user && user.authenticate(logged_in_params[:password])
      token = JWT.encode({user_id: user.id}, 'SECRET')
      render json: {user: user, jwt: token}
    else
      render json: {error: ''}, status: 400
    end
  end

  def show
    id = request.authorization.to_i

    @user = User.find(id)
    if @user
      render json: {user_id: @user.id, parent_email: @user.parent_email, child_username: @user.child_username}
   # string = request.authorization
   # token = JWT.decode(string, 'SECRET')
   # byebug
   # id = token['user_id'].to_i
   # @user = User.find(id)
   # debugger
   # if @user
   #   render json: {user_id: @user.id, parent_email: @user.parent_email}
   else
     render json: {error: 'error occured'}, status: 422
   end
  end


  private
  def logged_in_params
    params.require(:user).permit(:parent_email, :password)
  end

end
