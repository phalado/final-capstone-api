class FlyClassesController < ApplicationController
  before_action :set_instructor
  before_action :set_flyClass, only: [:show, :update, :destroy]

  def index
    json_response(@instructor.fly_classes)
  end

  def show
    json_response(@item)
  end

  def create
    @instructor.fly_classes.create!(flyClass_params)
    json_response(@instructor, :created)
  end

  def update
    @fly_class.update(flyClass_params)
    head :no_content
  end

  def destroy
    @fly_class.destroy
    head :no_content
  end

  private

  def flyClass_params
    params.permit(:user_id, :classTime, :status)
  end

  def set_instructor
    @instructor = Instructor.find(params[:instructor_id])
  end

  def set_flyClass
    @fly_class = @instructor.fly_classes.find_by!(id: params[:id]) if @instructor
  end
end
