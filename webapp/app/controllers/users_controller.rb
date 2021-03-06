class UsersController < ApplicationController
  def signup
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to '/admin'
    else
      redirect_to '/signup'
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :role, :username)
  end
end
