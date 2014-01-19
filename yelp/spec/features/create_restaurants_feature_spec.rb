require 'spec_helper'

describe 'creating restaurants' do
	context 'given the name and description' do
		it 'should display new restaurants on the list of restaurant page' do
			visit '/restaurants/new'
			fill_in 'Name', with: 'McDonalds'
			fill_in 'Description', with: "I'm lovin' it"
			click_button 'Submit'

			expect(current_path).to eq '/restaurants'
			expect(page).to have_content 'McDonalds'
		end
	end
end