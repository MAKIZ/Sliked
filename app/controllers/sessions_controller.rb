class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    email = user_params[:email]
    password = user_params[:password]

    user = User.find_from_credentials(email, password)

    if user
      sign_in(user)
      flash[:notice] = "Hi, #{user}! You signed in!"
      redirect_to user_path(user)
    else
      flash[:error] = "User not found :("
      @user = User.new(email: email)
      render :new
    end
  end

  def destroy
    sign_out
    flash[:notice] = 'You signed out!'
    redirect_to new_session_path
  end

  private
    def user_params
      params.require(:user).permit(:email, :password)
    end
end