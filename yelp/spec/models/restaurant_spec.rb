require 'spec_helper'

describe Restaurant do
  
  describe '.avarange_rating' do
    #lazely evealuated not work until ref to it
  	let(:restaurant) { create(:restaurant) }
    #before each test will be created everytime even not using
    #let!(:new_restaurant){ create(:restaurant) }
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
