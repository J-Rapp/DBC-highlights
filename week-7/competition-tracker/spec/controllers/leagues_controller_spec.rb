require 'rails_helper'

describe LeaguesController do
  describe "GET #index" do
    before(:each) do
      get :index
    end
    it 'responds with a status of 200' do
      expect(response.status).to eq(200)
    end
  end
end
