module ApplicationHelper

def current_league
  @current_league = League.find(params['league_id'])
end

def options_for_form_new_match
    @round_options = @current_league.array_of_rounds_possible

    @competitor_options = @current_league.competitors.collect do |p|
     [ p.name, p.id ]
    end
end


end
