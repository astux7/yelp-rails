require 'spec_helper'

describe 'reviewing' do
	before do
		login

		Restaurant.create(name: 'McDonalds', description: 'Bla bla bla')
	end

	it 'can add a review to a restaurant' do
		visit '/restaurants'
		click_link 'McDonalds'
		click_link 'Add a review'

		#fill_in 'Name', with: 'Asta'
		fill_in 'Review', with: 'The food was good'
		select 2, from: 'Rating'
		click_button 'Submit'

		expect(page).to have_content 'The food was good'
	end
end