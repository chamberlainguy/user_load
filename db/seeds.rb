# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



user_data = 
[{email_address:	'fred@gmail.com',
  first_name: 		'Fred',
  last_name: 		'Flintstone',
  reporting_to_email_address: 'nate@hotmail.com'},
  
  {email_address:   'barney@gmail.com',
  first_name: 		'Barney',
  last_name: 		'Rubble',
  reporting_to_email_address: 'nate@hotmail.com'},
  
  {email_address:   'nate@hotmail.com',
  first_name: 		'Nate',
  last_name: 		'Slate',
  reporting_to_email_address: nil}
]

User.destroy_all

# Load basic user information
user_data.each do |user|

	 new_user = User.create email_address: user[:email_address],
	 			first_name: user[:first_name],
	 			last_name: user[:last_name]

	 unless new_user.persisted?
	 	puts user[:first_name] + ' ' + user[:last_name] + ' validation failed, not created'			
	 end	

end

# Setup the relationship to boss
user_data.each do |user|

 	if user[:reporting_to_email_address].present?
 		
 		boss = User.find_by email_address: user[:reporting_to_email_address]
 		if boss
	 		worker = User.find_by email_address: user[:email_address]
	 		if worker
	 			worker.reports_to_user = boss
	 			worker.save
	 		else
	 			puts user[:email_address] + ' not found'
	 		end
	 	else
	 		puts user[:reporting_to_email_address] + ' not found'
	 	end	
 	end	

 end





