require 'spec_helper'

describe 'retaurants index' do
	context 'with restaurants' do
		it 'should display the names and descriptions of the restaurants' do
			Restaurant.create(name: 'Nandos', description: 'Chiken')
			visit '/restaurants'
			expect(page).to have_content 'Nandos'
			expect(page).to have_content 'Chiken'
		end
	end

	context 'without restaurants' do
		it 'should display a message' do
			visit '/restaurants'
			expect(page).to have_content 'No restaurants yet!'
		end
	end
end