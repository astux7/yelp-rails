# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :admin do
  	email "admin@basta.lt"
		password "12345678"
		password_confirmation "12345678"
  end
  
  factory :admintwo , class: Admin do
    email "admin2@basta.lt"
    password "12345678"
    password_confirmation "12345678"
  end
end
