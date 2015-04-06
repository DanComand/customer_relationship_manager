require './contact'
require './rolodex'

class CRM

	def self.run
		my_crm = CRM.new
		my_crm.main_menu
	end

	def initialize
		@rolodex = Rolodex.new
	end	

	def print_main_menu
		puts "[1] Add new contact"
		puts "[2] Modify an existing contact"
		puts "[3] Delete a contact"
		puts "[4] Display a contact"
		puts "[5] Display all contacts"
		puts "[5] Display an attribute"
		puts "[6] Exit"
		puts "Enter a selection"
	end

	def call_selection(selection)
		add_new_contact if selection == 1
		modify_contact if selection == 2
		delete_contact if selection == 3
		display_contact if selection == 4
		display_by_attribute if selection == 5
		exit if selection == 6
	end	

	def main_menu
		while true
		print_main_menu
		selection = gets.chomp.to_i
		call_selection(selection)
		end
	end

	def add_new_contact
		print "First Name:"
		first_name = gets.chomp
		print "Last Name:"
		last_name = gets.chomp
		print "Email:"
		email = gets.chomp
		print "Notes:"
		notes = gets.chomp
		contact = Contact.new(first_name, last_name, email, notes)
		@rolodex.add_contact(contact)

	end
end

def display_contact

	print "Enter id of user you'd like to see."
	contact_id = gets.chomp.to_i
	contact = @rolodex.find(contact_id)
	print contact
end	

CRM.run










