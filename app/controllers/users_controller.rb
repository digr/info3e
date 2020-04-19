class UsersController < ApplicationController
  skip_before_action :authorized
  before_action :authorized_admin

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(params.require(:user).permit(:username,
                                                     :password,
                                                     :fullname))

    @user.teacher = (params[:user][:role] == "2")

    if @user.save
      redirect_to :users
    else
      render :new
    end
  end
end
