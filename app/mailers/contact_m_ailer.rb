class ContactMAiler < ActionMailer::Base
	default from: 'contact@agencedelavilledieu.fr'

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