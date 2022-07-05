-- This season's games happened between 2020-12-12 and 2021-02-06.
-- For this test to pass, this query must return no results.

select date
from {{ ref('zzz_game_details') }}
where date < '2020-12-12'
or date > '2021-02-06'