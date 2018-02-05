class StaticPagesController < ApplicationController
  def home
  end

  def secret_page

  	unless 	logged_in?
  		redirect_to login_path
  		flash.now[:danger] = 'Invalid email/password comination' #on voulait mettre un petit flash, mais ça n'a pas marché !
  	end

  end
end
