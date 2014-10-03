require 'spec_helper'

describe 'creating restaurants' do
  
  before do
    login_admin
  end

  context 'given a name and description' do

    it 'should display the new restaurant on the list of restaurants' do
      visit '/restaurants/new'
      fill_in 'Name', with: 'McDonalds'
      fill_in 'Description', with: "I'm lovin' it"
      fill_in 'Opening hours', with: "16pm"
      fill_in 'Price range', with: "10£"
      click_button 'Create Restaurant'
      restaurant_id = Restaurant.first.id
      expect(current_path).to eq '/restaurants/'+restaurant_id.to_s
      expect(page).to have_content 'McDonalds'
    end

  end

  context 'without a name and description' do

    it 'should display errors' do
      visit '/restaurants/new'
      click_button 'Create Restaurant'

      expect(page).to have_content 'error'
    end

  end
end