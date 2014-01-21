require 'spec_helper'

describe 'reviewing' do
	before do
		login
		@nd = create(:restaurant) 
	end

	it 'can add a review to a restaurant' do
		visit '/restaurants'
		click_link @nd.id
		click_link 'Add a review'

		fill_in 'Name', with: 'jappppp'
		fill_in 'Content', with: 'The food was good'
		select 2, from: 'Rating'
		click_button 'Create Review'

		expect(page).to have_content 'The food was good'
	end
end