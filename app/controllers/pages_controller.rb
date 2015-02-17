class PagesController < InheritedResources::Base
	def home
		@houses = House.order("created_at desc").limit(8)
	end
	
	def contact
	end

	def sendmail
		name = params[:name]
		email = params[:email]
		message = params[:message]

		if name != "" && email != "" && message != ""
			ContactMAiler.contact_mail(name, email, message).deliver
		end

		redirect_to action: :home
	end
end