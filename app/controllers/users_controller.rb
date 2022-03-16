class UsersController < ApplicationController
  # frozen_string_literal: true
  before_action :set, only: [:show, :edit, :update, :destroy]
  def index
    @users = User.all
    
  end

  def show
  end

  def new
    @user = User.new
    @user.build_address
    
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "#{@user.username}, you have successfully signed up"
      redirect_to user_path(@user)
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to signup_path
    end
  
  end

  def edit
  end

  def update
  end

  def destroy
    @user.destroy
    redirect_to home_path
  end

  private
    def user_params
      params.require(:user).permit(:username, :email, :password,address_attributes: [:house_number, :street_name, :road])
    end

    def set
      @user= User.find(params[:id])
    end
end
