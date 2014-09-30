require 'spec_helper'

describe 'reviewing' do
	before do
		login_admin
		@nd = FactoryGirl.create(:restaurant)
		visit '/'
		logout_admin
		#raise page.html
		#page.driver.delete('/admins/sign_out')
		visit '/'


	 #     click_link 'Register'
	 #     fill_in 'Email', with: 'ap@a.com'
	 #     fill_in 'Password', with: '12345678'
	 #     fill_in 'Password confirmation', with: '12345678'
	 #     click_button 'Sign up'

	end
  context 'User can create review' do
		it 'can add a review to a restaurant' do
			login_new 
	  # save_and_open_page
			visit '/restaurants'
			 
			click_link @nd.name
			click_link 'Add a review'

			fill_in 'Name', with: 'Like it '
			fill_in 'Content', with: 'The food was good'
			select 2, from: 'Rating'
			click_button 'Create Review'

			expect(page).to have_content 'The food was good'
		end
	end

	context 'Admin can delete the review' do

    it 'should have two delete buttons' do 
      login_new 
			visit '/restaurants'
			click_link @nd.name
			click_link 'Add a review'
			fill_in 'Name', with: 'Like it '
			fill_in 'Content', with: 'The food was good'
			select 2, from: 'Rating'
			click_button 'Create Review'
      login_admin_new
      visit '/restaurants'
      #save_and_open_page
      first('.restaurant').click_link @nd.name
      #save_and_open_page
			expect(page).to have_selector('.btn-danger', count: 2)
		end
		it 'shlould delete the review' do 
      login_new 
			visit '/restaurants'
			click_link @nd.name
			click_link 'Add a review'
			fill_in 'Name', with: 'Like it '
			fill_in 'Content', with: 'The food was good'
			select 2, from: 'Rating'
			click_button 'Create Review'
      login_admin_new
      visit '/restaurants'
      first('.restaurant').click_link @nd.name
      page.all('.btn-danger')[1].click
			expect(page).to have_selector('.btn-danger', count: 1)
		end

  end
end