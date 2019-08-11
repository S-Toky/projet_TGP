class SessionsController < ApplicationController

  def new
  @session = User.new

  end

  def create

  	 # cherche s'il existe un utilisateur en base avec l’e-mail
 	@session = User.find_by(email: params["email"])

  # on vérifie si l'utilisateur existe bien ET si on arrive à l'authentifier (méthode bcrypt) avec le mot de passe 
  if @session && @session.authenticate(params["password"])
    session[:user_id] =@session.id
      if @session == nil
          render "new"
       else
        flash[:success] = "succesfully"
        redirect_to "/users"
      end
    # redirige où tu veux, avec un flash ou pas
  else
    flash[:failed] = 'Invalid email/password combination'
    render 'sessions/new'
  end
  end

  def destroy
  	session.delete(:user_id)
    redirect_to "/"
  end
end


