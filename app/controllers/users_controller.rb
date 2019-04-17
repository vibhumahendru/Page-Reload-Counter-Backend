class UsersController < ApplicationController

  def index
    @users = User.all
    render json: @users, status: :ok
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end

  def create
    @user = User.create({name: params[:name]})
    if @user.valid?
      render json: @user, status: :created
    else
      render json: @user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def update
    @user = User.find(params[:userId])
    @user.update(name: params[:name])
    render json: @user
  end



end
