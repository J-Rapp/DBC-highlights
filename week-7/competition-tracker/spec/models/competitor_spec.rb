require 'rails_helper'

RSpec.describe Competitor, type: :model do
  describe 'Model Competitor' do
    let (:league_one) { League.create( {name: "Super Pokemon"} ) }
    let (:evee) { league_one.competitors.create( {name: "Evee"} )}
    let (:eevee_po) { league_one.competitors.create!( {name: "Eevee"} ) }
    let (:ponyata_po) { league_one.competitors.create!( {name: "Ponyata"} ) }
    let (:invalid_player) { league_one.competitors.create( {name: ""} )}
    let (:no_league_player) { Competitor.create( {name: "Cool guy"} )}
    let (:good_params) do
      {
        round_number: 4,
        league_id: league_one.id,
        competitor_one_id: eevee_po.id,
        competitor_two_id: ponyata_po.id,
        winner: eevee_po,
        loser: ponyata_po
      }
    end

    let (:good_match) do
      Match.create!(good_params)
    end

    it 'has a name' do
      expect(evee.name).to eq "Evee"
    end
    it 'sets default value of the wins to 0' do
      expect(evee.wins.count).to eq 0
    end
    it 'sets default value of the loses to 0' do
      expect(evee.losses.count).to eq 0
    end

    context 'creating a match with a specific competitors and looking up the results' do

      before (:each) { good_match }

      it 'can be assign to a specific match as a competitors in it' do
        expect(good_match.competitors).to match_array [eevee_po, ponyata_po]
      end
      it 'has a number of the matches played changed to 1 once the competitor gets enrolled in a match' do
        expect(ponyata_po.reload.matches.count).to eq 1
      end
      it 'is a winner of the match after being assigned a winning position' do
        expect(good_match.winner).to eq eevee_po
      end
      it 'has a number of wins changed to 1 if the competitor has won the match' do
        expect(eevee_po.wins.count).to eq 1
      end
      it 'has a number of losses changed to 1 if the competitor has lost the match' do
        expect(ponyata_po.losses.count).to eq 1
      end
      it 'has "w" as a result value for the round in the competitor won the match in this given round' do
        expect(eevee_po.results).to eq({r4: 'w'})
      end
      it 'has "l" as a result value for the round in the competitor lost the match in this given round' do
        expect(ponyata_po.results).to eq({r4: 'l'})
      end

    end

    context 'validations' do
      it 'is not valid without a name' do
        expect(invalid_player).to be_invalid
      end
      it 'is not valid without a league' do
        expect(no_league_player).to be_invalid
      end
      xit 'can only participate in one match per specific round'
    end

    context 'associations' do
      it 'belongs to one specific league' do
        expect(evee.league.name).to eq "Super Pokemon"
      end
      xit 'participates in number of matches that is equal to the number of rounds of the league'
    end
  end
end
