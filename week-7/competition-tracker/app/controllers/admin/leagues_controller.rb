class Admin::LeaguesController < AdminController

  def show
    @league = League.find(params[:id])
  end

  def update
    @league = League.find(params[:id])
    @league.update(name: league_name_params)
    redirect_to admin_league_path(@league)
  end

  private

  def league_name_params
    params[admin_league_path(@league)]["name"]
  end

end
