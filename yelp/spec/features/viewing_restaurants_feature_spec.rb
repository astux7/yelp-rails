require 'spec_helper'

describe 'retaurants index' do

	context 'with restaurants' do
		before(:each) do
			create(:restaurant, name: 'Mcdonalds') 
		end
		it 'should display the names and descriptions of the restaurants' do
			
			visit '/restaurants'
			expect(page).to have_content 'Mcdonalds'
			expect(page).to have_content 'Restaurant page for Nandos'
		end

		it 'has individual pages for each restaurant' do
	        visit '/restaurants'

	        click_link 'Mcdonalds'
	        expect(page).to have_content 'Restaurant page for Nandos'
	    end

	end

	context 'without restaurants' do
		it 'should display a message' do
			visit '/restaurants'
			expect(page).to have_content 'No restaurants yet!'
		end
	end
end