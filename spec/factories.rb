FactoryGirl.define do
	factory :user do
		sequence(:name) { |n| "Person #{n}" }
		sequence(:email) { |n| "person_#{n}@example.com" }
		password "foobar"
		password_confirmation "foobar"
	end

	factory :lunch do
		user
	end

	factory :restaurant do
		lunch
		sequence(:name) { |n| "Restaurant #{n}" }
		sequence(:website) { |n| "#{n}" }
	end
end