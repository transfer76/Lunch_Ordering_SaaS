class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_current_user, exept: [:index, :show]

  def index
    @users = User.all

    authorize @users
  end

  def show
    @user = User.find(params[:id])

    authorize @user
  end

  def edit
    authorize @user
  end

  def update
    authorize @user

    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    authorize @user

    @user.destroy

    redirect_to users_url, notice: 'User was successfully destroyed.'
  end

  private

  def set_current_user
      @user = current_user
    end

  def user_params
    params.fetch(:user, {}).permit(:username, :phone, :email, :password)
  end
end
