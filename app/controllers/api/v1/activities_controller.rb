class Api::V1::ActivitiesController < ApplicationController

  skip_before_action :authorized, only: [:create, :index]

  def index
    @activities = Activity.all
    render json: @activities
  end

  def create
    @activity = Activity.create(activity_name: params[:activity])
    if @activity.valid?
      render json: {activity_id: @activity.id ,activity_name: @activity.activity_name}
    else
      render json: {error: "Something is wrong"}, status: 422
    end
  end


end
