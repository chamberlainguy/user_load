# == Schema Information
#
# Table name: users
#
#  id            :integer          not null, primary key
#  email_address :string           default(""), not null
#  first_name    :string           default(""), not null
#  last_name     :string           default(""), not null
#  parent_id     :integer          not null
#  created_at    :datetime
#  updated_at    :datetime
#

require 'rails_helper'

RSpec.describe User, type: :model do

	describe 'A user' do

		it 'should not save an invalid email address (1)' do
			user = User.create email_address: 'bad_email_address'
			expect(user.persisted?).to eq(false)
		end

		it 'should not save a nil email address' do
			user = User.create email_address: nil
			expect(user.persisted?).to eq(false)
		end

		it 'should not save a missing email address' do
			user = User.create email_address: ''
			expect(user.persisted?).to eq(false)
		end

		it 'should save a valid email address' do
			user = User.create email_address: 'good@email.com'
			expect(user.persisted?).to eq(true)
		end
		
	end
 	
end
