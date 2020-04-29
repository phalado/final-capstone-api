class FlyClassesController < ApplicationController
  before_action :set_flyClass, only: [:show, :update, :destroy]

  def index
    json_response(FlyClass.all)
  end

  def show
    json_response(@item)
  end

  def create
    @fly_class = FlyClass.create!(flyClass_params)
    json_response(@fly_class, :created)
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
    params.permit(:instructor_id, :user_id, :classTime, :status)
  end

  def set_flyClass
    @fly_class = FlyClass.find_by!(id: params[:id]) if @instructor
  end
end
