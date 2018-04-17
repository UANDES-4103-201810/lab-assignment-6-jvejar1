class RegistrationsController < ApplicationController
	def new
	
	end

	def create
	    #complete this method
	reg_params = registration_params
	user = User.create(reg_params)
	if user.errors.any?
		errors_str="ERROR(S) :\n"
		user.errors.messages.each do |error|
			error.each do |key|
				errors_str+=key.to_s
				errors_str+=": "




			end
				errors_str+="\n"
		end


		flash.now[:error]=errors_str
		render action: 'new'

	else

		redirect_to '/'

		end


	end

	def registration_params


		p = params.require(:registrations).permit(:name,:last_name,:email,:phone,:password)
		return p
	end
end
