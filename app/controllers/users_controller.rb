class UsersController < ApplicationController
  before_action :user_must_be_logged_in, only: [:show]
  before_action :redirect_if_logged_in, only: [:new, :create]

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in_user!(@user)
      redirect_to user_url(@user)
    else
      render :new
    end
  end

  def user_must_be_logged_in
    unless logged_in?
      redirect_to new_user_url
    end
  end
end
