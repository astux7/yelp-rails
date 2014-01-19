require 'spec_helper'

describe 'editing restaurants' do
	before do
		Restaurant.create name: 'Old name'
	end
	it 'can change the name of a restaurant' do
		visit '/restaurants'
		click_link 'Edit this restaurant'
		fill_in 'Name', with: 'New name'
		click_button 'Update Restaurant'

		expect(page).to have_content 'New name'
	end
end