require 'rails_helper'

describe Admin::MatchesController do

  let(:league) { League.create!(name: "Cool league") }
  let(:admin) { User.create!(username: "CoolChick", password:'verysecret') }

  before(:each) do
      controller.session[:user_id] = admin.id
  end

  describe "GET #new" do

    it 'responds with a status of 200' do
      get :new,:league_id=> league.id
      expect(response.status).to eq(200)
    end

    it 'has a form'

    it 'has the fields to submit the match'

  end

  describe "POST #create" do

    it 'responds with a status of 200' do
      post :create,:league_id=> league.id, match: {round_number: 1}
      expect(response.status).to eq(200)
    end

    it 'sends the data to the db and saves the match if valid'

    it "doesn't save the match if not not valid"

    it 'redirects you to admin dashboard where this new match is showing'
  end
end
