require 'spec_helper'

describe 'filtering by tags' do
  before do 
    tag = create(:tag)
    tagged = create(:restaurant, name: 'Mcdonalds')
    create(:restaurant,name: 'Kandos')
    tagged.tags << tag
  end  

  it 'can filter by clicking on the tag' do
    visit '/restaurants'
    click_link Restaurant.first.name
    click_link '#Pub'
    expect(page).to have_content 'Nandos'
    expect(page).to_not have_content 'Kandos'
  end
end