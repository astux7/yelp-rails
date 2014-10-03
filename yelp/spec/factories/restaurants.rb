FactoryGirl.define do
	factory :restaurant do
		name "Nandos"
		description "Restaurant page for Nandos"
		promoted false
    price_range '25£'
    opening_hours '12-3pm'
	end
end