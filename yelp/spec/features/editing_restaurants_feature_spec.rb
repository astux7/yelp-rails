require 'spec_helper'

describe 'editing restaurants' do
	before do
	    login_admin
		create(:restaurant) 
		visit '/restaurants'
	end
	it 'can change the name of a restaurant' do
		click_link 'Edit'
		fill_in 'Name', with: 'KFC'
		click_button 'Update Restaurant'

		expect(page).to have_content 'KFC'
	end
	it 'can delete the retaurant' do
		click_link 'Delete'
		expect(page).not_to have_content 'McDonalds'
	end
end