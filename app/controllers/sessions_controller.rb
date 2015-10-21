class SessionsController < ApplicationController


  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.find_by_credentials(session_params[:user_name], session_params[:password])
    @user.password = session_params[:password]
    if @user
      sign_in(@user)
      redirect_to cats_url
    else
      render :new
      #print error messages
    end


  end

  def destroy
    sign_out(current_user)
    redirect_to new_session_url
  end

  def session_params
    params.require(:session).permit(:user_name,:password)

  end



end
