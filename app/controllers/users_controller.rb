class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  def index
    @users = User.all
    json_response(@users)
  end

  def create
    @user = User.create!(user_params)
    # json_response({id: @user.id, name: @user.name, email: @user.email}, :created)
    json_response({status: true}, :created)
  end

  def show
    json_response({id: @user.id, name: @user.name, email: @user.email, classes: @user.fly_classes})
  end

  def update
    @user.update(user_params)
    json_response({status: true})
  end

  def check
    user = get_user(user_params)
    if user
      if user.authenticate(params[:password])
        json_response(user)
      else json_response(true)
      end
    else json_response(false)
    end
  end

  def destroy
    @user.destroy
    head :no_content
  end

  private

  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def get_user(u_params)
    return User.find_by(email: u_params[:email])
  end
end
