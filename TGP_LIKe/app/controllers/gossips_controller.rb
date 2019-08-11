class GossipsController < ApplicationController
  before_action :authenticate_user, only: [:show, :new, :create]

  def index
    @gossip = Gossip.all
    @comments = Comment.all
  end

  def new
    @gossips = Gossip.new
  end

  def create
    id = session[:user_id]
    @user = User.find(id)
    @gossips = Gossip.new(title: params["title"], content: params["content"], user_id: id) # avec xxx qui sont les données obtenues à partir du formulaire
      if @gossips.save # essaie de sauvegarder en base @gossip
        flash[:success] = "Potin bien créé !"
        redirect_to action: "index" # si ça marche, il redirige vers la page d'index du site
      else
       render "new" # sinon, il render la view new (qui est celle sur laquelle on est déjà),
      end
  end

  def edit
    @gossips =  Gossip.find(params[:id].to_i)

  end

  def show
    @gossips =  Gossip.find(params[:id].to_i)
    @user =  User.find(@gossips.user_id)
    @city = City.find(@user.city_id)
    @comments = @gossips.comments
  end

  def update
     @gossips =  Gossip.find(params[:id].to_i)
     gossip_params = params.require(:gossip).permit(:title, :content)
      if @gossips.update(gossip_params)
          redirect_to action: "show"
        else
          render :edit
      end
  end

  def destroy
    @gossips =  Gossip.find(params[:id].to_i)
    @gossips.destroy
    redirect_to action: "index"
  end


private


def authenticate_user
    unless User.find_by(id: session[:user_id])
      flash[:failed] = "Please log in."
      redirect_to new_session_path
    end
  end


end
  