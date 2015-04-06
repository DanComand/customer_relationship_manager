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
		display_all if selection == 5
		display_by_attribute if selection == 7
		exit if selection == 7
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

	def modify_contact
		print "Enter the id of the contact you'd like to modify."
		contact_id = gets.chomp.to_i
		 contact = @rolodex.find(contact_id)
		  puts contact.to_s
		print "Do you want to modify #{contact_id}?"
		confirm = gets.chomp.capitalize
		if confirm == "Yes"
			puts "Do you want to change?" 
			puts "[1]First name" 
			puts "[2]Last name" 
			puts "[3]Email" 
			puts "[4]Notes of #{contact_id}."
			user_choice = gets.chomp.to_i
			if user_choice == 1
				puts "Enter the new first name: "
				contact.first_name = gets.chomp
					puts contact.to_s
			elsif user_choice == 2
				puts "Enter the new last name: "
				contact.last_name = gets.chomp
			elsif user_choice == 3
				puts "Enter the new email: "
				contact.email = gets.chomp
			elsif user_choice == 4
				puts "Enter new notes: "
				contact.notes = gets.chomp
			end	
		end
		main_menu
	end


		# elsif user_choice == "n"


	def delete_contact
		print "Enter the contact id that you'd like to delete."
		contact_id = gets.chomp.to_i
		 contact = @rolodex.find(contact_id)
		  puts contact.to_s
		  print "Are you sure you want to delete #{contact_id}?"
		confirm = gets.chomp.capitalize
		@rolodex.delete_contact(contact)
		puts "This contact has been deleted."
	end

	def display_all
	 @rolodex.display_all


	def display_contact
		print "Enter id of user you'd like to see."
		contact_id = gets.chomp.to_i
		contact = @rolodex.find(contact_id)
		print contact.to_s
	end
end
end

CRM.run










