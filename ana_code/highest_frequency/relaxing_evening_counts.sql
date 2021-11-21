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