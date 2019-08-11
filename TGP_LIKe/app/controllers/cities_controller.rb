class CitiesController < ApplicationController
  def index
  end

  def create
  end

  def new
  end

  def edit
  end

  def show
    @gossips =  Gossip.find(params[:id].to_i)
    @user =  User.find(@gossips.user_id)
    @city = City.find(@user.city_id)
    @users = @city.users
  end

  def update
  end

  def destroy
  end
end

