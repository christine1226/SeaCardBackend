class Api::V1::ScoresController < ApplicationController
  skip_before_action :authorized, only: [:create, :progress]

  def create

    @user = User.find_by(parent_email: score_params[:user_id])
    @activity = Activity.find_by(id: score_params[:activity_id])
    @score = Score.create(correct_answer: score_params[:correct_answer], wrong_answer: score_params[:wrong_answer], user_id: @user.id, activity_id: score_params[:activity_id], activity_name: @activity.activity_name)
    if @score.valid?
      render json: {user_id: @user, activity_id: @score.activity_id, correct_answer: @score.correct_answer, wrong_answer: @score.wrong_answer}
    else
      render json: {error: "Something is wrong"}, status: 422
    end
  end

  private
  def score_params
    params.require(:score).permit(:correct_answer, :wrong_answer, :user_id, :activity_id, :activity_name)
  end


end
