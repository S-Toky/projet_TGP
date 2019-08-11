class UsersController < ApplicationController
  def index
    
  end

  def new
    #redirige vers la page de création de l'utilisateur
    @user = User.new
  end

  def create
    user_params = params.require(:user).permit(:first_name, :last_name, :email, :age, :city_id, :description, :password, :password_confirmation)
    #enregistre l'utilisateur créer 
    @user = User.new(user_params)
    @user.save
    flash[:success] = "Merci de vous connecter"
    redirect_to "/sessions/new"

  end

 

  def edit
  end

  def show
    @gossips =  Gossip.find(params[:id].to_i)
    @user =  User.find(@gossips.user_id)
    @city = City.find(@user.city_id)
  end

  def update
  end

  def destroy
  end
end
