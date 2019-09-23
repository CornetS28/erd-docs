# frozen_string_literal: true

FactoryBot.define do
	factory :user, class: User do
		email { 'amake@gmail.com' }
		first_name { 'Ada' }
		last_name { 'amaka' }
		surname { 'chinenye' }
		sex { 'female' }
		password { '123456322' }
  end
  
  factory :friend, class: User do
    email { 'mike@gmail.com' }
		first_name { 'Mike' }
		last_name { 'Brown' }
		surname { 'Bronze' }
		sex { 'male' }
		password { '123456322' }
  end
end
