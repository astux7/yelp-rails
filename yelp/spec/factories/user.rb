FactoryGirl.define do
	factory :user do
		email "a@a.lt"
		password "12345678"
		password_confirmation "12345678"
	end

  factory :usertwo, class: User do
    email "b@a.lt"
    password "12345678"
    password_confirmation "12345678"
  end
end