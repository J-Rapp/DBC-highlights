class Admin::DashboardsController < AdminController

  def show
    @league1 = League.all.first
    @league2 = League.all.last
  end

  def update
    League.all.update(number_of_rounds: round_params)
    @league1 = League.all.first
    @league2 = League.all.last
    redirect_to admin_dashboard_path
  end

  private

  def round_params
    params[admin_dashboard_path][:rounds]
  end
end
