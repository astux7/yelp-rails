require 'spec_helper'

describe User do
 # pending "add some examples to (or delete) #{__FILE__}"
 	describe 'reviewed?' do
 		let(:unreviewed){create(:restaurant)}
 		let(:asta){create(:user)}
 		before do
 			@reviewed = create(:restaurant)
 			create(:review, user: asta, restaurant: @reviewed)
 	end
 	it 'should return false for restaurant that I have not reviewed' do
 		expect(asta.reviewed?(unreviewed)).to be_false
 	end
	it 'should return true for restaurant that I have  reviewed' do
 		expect(asta.reviewed?(reviewed)).to be_true
 	end
 	end
end
