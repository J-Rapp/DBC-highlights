class Admin::CompetitorsController < AdminController

  def create
    @league = League.find(params[:league_id])
    @league.competitors.create(competitor_form_params)
    redirect_to admin_league_path(@league)
  end

  def update
    @league = League.find(params[:league_id])
    competitor = Competitor.find(params[:id])
    competitor.update(competitor_form_params)
    redirect_to admin_league_path(@league)
  end

  def destroy
    @league = League.find(params[:league_id])
    competitor = Competitor.find(params[:id])
    competitor.destroy
    redirect_to admin_league_path(@league)
  end

  private

  def competitor_form_params
    params.require(:competitor).permit(:name)
  end
end
