class ContactMAiler < ActionMailer::Base
	default from: 'orefice.maxime@gmail.com'

	def contact_mail(name, email, message)

		@name = name
		@email = email
		@message = message

		mail(
			to: 'agencedelavilledieu@orange.fr',
			subject: 'Contact Agence de la villedieu'
			)
		
	end

end