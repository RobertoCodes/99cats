class UsersController < ApplicationController

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.create!(user_params)
    @user.password=(user_params[:password])
    if @user.save
      sign_in(@user)
      redirect_to cats_url
    else
      render :new
    end
  end


private

  def user_params
    params.require(:user).permit(:user_name,:password)
  end

end
