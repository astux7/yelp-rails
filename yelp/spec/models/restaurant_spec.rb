require 'spec_helper'

describe Restaurant do
  
  describe '.avarange_rating' do
  	let(:restaurant) {Restaurant.create(name: 'Burger', description: 'King' )}
  	let(:new_restaurant) {Restaurant.create(name: 'Nandos', description: 'chicken', rating: 5)}
  	
  end
end
