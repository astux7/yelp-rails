require 'spec_helper'

describe 'reviewing' do
	before do
		@admin = login_admin
		@nd = create(:restaurant, name: "kuku") 
		logout(@admin)
		#login_new
		#page.driver.delete('/admins/sign_out')
		 visit '/'
	     click_link 'Register'
	     fill_in 'Email', with: 'ap@a.com'
	     fill_in 'Password', with: '12345678'
	     fill_in 'Password confirmation', with: '12345678'
	     click_button 'Sign up'

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