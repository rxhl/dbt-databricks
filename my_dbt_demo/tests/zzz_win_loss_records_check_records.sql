-- Each team participated in 4 games this season.
-- For this test to pass, this query must return no results.

select wins, losses
from {{ ref('zzz_win_loss_records') }}
where wins < 0 or wins > 4
or losses < 0 or losses > 4
or (wins + losses) > 4