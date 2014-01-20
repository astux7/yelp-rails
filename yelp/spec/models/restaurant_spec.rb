require 'spec_helper'

describe Restaurant do
  
  describe '.avarange_rating' do
  	let(:restaurant) { Restaurant.create(name: 'Burger King', description: 'The food here is totally awesome blah blah!') }

    context 'no ratings' do
      it 'returns "Unrated"' do
        expect(restaurant.average_rating).to eq 'Unrated'
      end
    end

    context 'a single rating' do
      it 'returns that rating' do
        restaurant.reviews << Review.new(rating: 3)

        expect(restaurant.average_rating).to eq 3
      end
    end

    context 'multiple ratings' do
      it 'returns an average of those ratings' do
        restaurant.reviews << Review.new(rating: 2)
        restaurant.reviews << Review.new(rating: 4)

        expect(restaurant.average_rating).to eq 3
      end
    end

  end
end
