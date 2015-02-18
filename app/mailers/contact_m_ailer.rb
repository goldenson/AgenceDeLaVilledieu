class ContactMAiler < ActionMailer::Base
	default from: 'orefice.maxime@gmail.com'

	def contact_mail(name, email, message)

		@name = name
		@email = email
		@message = message

		mail(
			to: 'orefice.maxime@gmail.com',
			subject: 'Contact Agence site internet'
			)
		
	end

end