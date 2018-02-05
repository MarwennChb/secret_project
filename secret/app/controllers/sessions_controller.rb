class SessionsController < ApplicationController
  def new
  end

	def create
		user = User.find_by(email: params[:session][:email].downcase) #le downcase pour éviter que les gens rentre leur emails en capital et du coup pour le matching par la suite ça peut poser problème
		if user && user.authenticate(params[:session][:password]) #si l'utilisateur exite et si on arrive à l'authetifier  fonction donnée par la méthode secure password par la gem decrypt
			#login(cf fonction login dans le helper)
			log_in user
			redirect_to user #nous redirige vers la page show du User
		else
			#message erreur
			flash.now[:danger] = 'Invalid email/password comination' #le probléme avec le flash danger, c'est que quand l'utilisateur va passer dans une autre page, il ne s'afface pas. Cf ci dessous l'histoire du flash.now
			render 'new'
		end

  end

  def destroy

  	log_out
  	redirect_to root_url

  end
end
