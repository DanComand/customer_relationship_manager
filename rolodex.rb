class Rolodex
	def initialize
		@contacts = []
		@id = 1000
	end

	def add_contact(contact)
		contact.id = @id
		@contacts << contacts
		@id += 1
	end

	def find(contact_id)
		@contact.find do |contact|
			contact.id == contact.id			
	end	
end
end