require 'rails_helper'

describe 'League' do
  let(:league) { League.new(name: "League 1") }
  describe 'validations' do
    describe 'when valid' do
      it 'validates the presence of name' do
        expect(league).to be_valid
      end

      it 'validates the number_of_rounds is set to 5' do
        expect(league.number_of_rounds).to eq 5
      end
    end
  end
end
