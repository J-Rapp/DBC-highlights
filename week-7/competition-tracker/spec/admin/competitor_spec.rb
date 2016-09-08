require 'rails_helper'

feature "admin competitor update" do
  let!(:league1) { League.create(name: "League 1") }
  let!(:competitor) { Competitor.create(name: "Jordan Sillypants", league_id: "#{league1.id}") }
  before(:each) do
    User.create(
      username: 'admin',
      password: 'secret',
    )

    visit 'admin/session/new'
    fill_in 'Username', with: 'admin'
    fill_in 'Password', with: 'secret'
    click_button 'Log In'
  end

  it 'can add a competitor to a given league' do
    visit admin_league_path(league1)

    fill_in 'competitor_name', with: 'Jake Stupidhead'

    click_button('Add Competitor')

    expect(current_path).to eq admin_league_path(league1)

    expect(page).to have_content 'Stupidhead'
  end

  it 'can delete a competitor from a given league' do
    visit admin_league_path(league1)

    expect(page).to have_content 'Sillypants'

    click_button("delete-#{competitor.id}")

    expect(current_path).to eq admin_league_path(league1)

    expect(page).to_not have_content 'Sillypants'
  end

end
