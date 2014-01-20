require 'spec_helper'

describe Review do
	describe '.rating' do
	    let(:bk) { Restaurant.create(name: 'Burger King', description: 'The food here is totally awesome blah blah!') }

	    it 'cannot be less than 1 star' do
	        review = Review.new(rating: 0, restaurant: bk)
	        expect(review).not_to be_valid
	    end

	    context 'an unpromoted restaurant' do

	      it 'can be rated up to 4 stars' do
	        review = Review.new(rating: 4, restaurant: bk)
	        expect(review).to be_valid
	      end

	      it 'cannot be rated 5 stars or higher' do
	        review = Review.new(rating: 5, restaurant: bk)
	        expect(review).not_to be_valid
	      end
	    end

	    context 'promoted restaurant' do
	      let(:bk) { Restaurant.create(name: 'Burger King', promoted: true, description: 'The food here is totally awesome blah blah!') }

	      it 'can be rated up to 5 stars' do
	        review = Review.new(rating: 5, restaurant: bk)
	        expect(review).to be_valid
	      end

	      it 'cannot be rated 6 stars or higher' do
	        review = Review.new(rating: 6, restaurant: bk)
	        expect(review).not_to be_valid
	      end
	    end

    end

end
