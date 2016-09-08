class Admin::MatchesController < AdminController
  include ApplicationHelper

  def new
    @current_league = current_league
    @match = @current_league.matches.new
    options_for_form_new_match

  end

  def create
    @current_league = current_league
    @match = @current_league.matches.new(match_params)
    options_for_form_new_match

    if @match.save
      redirect_to '/admin/dashboard'
    else
      render :new
    end
  end

  def update
    match = Match.find(params[:id])
    match.winner = match.competitors.find(params[:competitor_id])
    index = match.competitors.find_index(match.winner)
    index == 0 ? match.loser = match.competitors[1] : match.loser = match.competitors[0]
    match.update_attribute(:winner_id, match.winner.id)
    match.update_attribute(:loser_id, match.loser.id)
    redirect_to admin_dashboard_path
  end

  private
  def match_params
    params.require(:match).permit(:round_number, :competitor_one_id, :competitor_two_id)
  end

end
