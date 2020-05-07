class FlyClassesController < ApplicationController
  before_action :set_fly_class, only: %i[show update destroy]

  def index
    json_response(FlyClass.all)
  end

  def show
    json_response(@fly_class)
  end

  def create
    @fly_class = FlyClass.create!(fly_class_params)
    json_response(@fly_class, :created)
  end

  def update
    @fly_class.update(fly_class_params)
    head :no_content
  end

  def destroy
    @fly_class.destroy
    head :no_content
  end

  private

  def fly_class_params
    params.permit(:instructor_id, :user_id, :classTime, :status)
  end

  def set_fly_class
    @fly_class = FlyClass.find_by!(id: params[:id])
  end
end
