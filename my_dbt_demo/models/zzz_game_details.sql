{{ config(
  materialized='table',
  file_format='delta'
) }}

-- Step 4 of 4: Replace the visitor team IDs with their city names.
select
  game_id,
  home,
  t.team_city as visitor,
  home_score,
  visitor_score,
  -- Step 3 of 4: Display the city name for each game's winner.
  case
    when
      home_score > visitor_score
        then
          home
    when
      visitor_score > home_score
        then
          t.team_city
  end as winner,
  game_date as date
from (
  -- Step 2 of 4: Replace the home team IDs with their actual city names.
  select
    game_id,
    t.team_city as home,
    home_score,
    visitor_team_id,
    visitor_score,
    game_date
  from (
    -- Step 1 of 4: Combine data from various tables (for example, game and team IDs, scores, dates).
    select
      g.game_id,
      gop.home_team_id,
      gs.home_team_score as home_score,
      gop.visitor_team_id,
      gs.visitor_team_score as visitor_score,
      g.game_date
    from
      appschema.zzz_games as g,
      appschema.zzz_game_opponents as gop,
      appschema.zzz_game_scores as gs
    where
      g.game_id = gop.game_id and
      g.game_id = gs.game_id
  ) as all_ids,
    appschema.zzz_teams as t
  where
    all_ids.home_team_id = t.team_id
) as visitor_ids,
  appschema.zzz_teams as t
where
  visitor_ids.visitor_team_id = t.team_id
order by game_date desc