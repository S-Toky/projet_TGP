module GossipsHelper
	def current_users
    User.find_by(id: session[:user_id])
  end
end
