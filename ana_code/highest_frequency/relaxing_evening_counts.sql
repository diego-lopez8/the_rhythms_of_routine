use dtl310;
SELECT
  trackname, 
  artistname,
  COUNT(trackname) AS `value_occurrence` 

FROM
  full_relaxing_evening

GROUP BY 
  trackname, artistname

ORDER BY 
  `value_occurrence` DESC

LIMIT 10;

use dtl310;
SELECT
  artistname,
  COUNT(artistname) AS `value_occurrence` 

FROM
  full_relaxing_evening

GROUP BY 
  artistname

ORDER BY 
  `value_occurrence` DESC

LIMIT 10;

use dtl310;
SELECT
  albumname, 
  artistname,
  COUNT(albumname) AS `value_occurrence` 

FROM
  full_relaxing_evening

GROUP BY 
  albumname, artistname

ORDER BY 
  `value_occurrence` DESC

LIMIT 10;