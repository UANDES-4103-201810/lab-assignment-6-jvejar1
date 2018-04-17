class SessionsController < ApplicationController
	def new
	end

	def create
		user_parameters = log_in_params
		current_user = User.find_by(user_parameters)
		if current_user.nil?
			flash.now[:error]="Invalid credentials"
			render action: 'new'

		else
			session[:current_user_id]=current_user.id
			flash[:success]="Bienvenido, "+current_user.name
			redirect_to user_path(id:current_user.id)
		end
	end

	def destroy
		#complete this method
		session.clear
	end

	def log_in_params
		return params.require(:session).permit(:email,:password)
	end
end
