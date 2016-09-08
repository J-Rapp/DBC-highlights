require 'rails_helper'

RSpec.describe Match, type: :model do
  describe 'Model Match' do
    let (:league_one) { League.create( {name: "Super Pokemon"} ) }
    let (:eevee) { league_one.competitors.create( {name: "Eevee"} ) }
    let (:ponyata) { league_one.competitors.create( {name: "Ponyata"} ) }
    let (:good_params) do
      {
        round_number: 7,
        league_id: league_one.id,
        competitor_one_id: eevee.id,
        competitor_two_id: ponyata.id,
        winner: eevee,
        loser: ponyata
      }
    end

    let (:good_match) do
      Match.create!(good_params)
    end


    it 'has a round_number' do
      expect(good_match.round_number).to eq 7
    end
    it 'tells you the name of the winner after the match is done' do
      expect(good_match.winner).to eq eevee
    end
    it 'tells you the name of the competitor who lost after the match is done' do
      expect(good_match.loser).to eq ponyata
    end

    context 'validations' do

      it 'is valid with valid params' do
        expect(good_match).to be_valid
      end

      it 'is not valid without a league_id' do
        invalid_params_without_league = { round_number: 7, winner: eevee, loser: ponyata }
        invalid_match = Match.create( invalid_params_without_league )
        expect(invalid_match).to be_invalid
      end

      xit 'belongs to a same league as the competitors enrolled in a match'

      xit 'is not valid without 2 competitors participating in the match'
      xit 'is not valid with 3 or more competitors enrolled in the match'
    end

  end
end
