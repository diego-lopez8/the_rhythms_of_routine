SELECT 
    avg(full_traffic_jam.valence) AS valence, "traffic jam" AS table_name 
    FROM full_traffic_jam
UNION ALL 
SELECT 
    avg(full_party.valence) AS valence, "party" AS table_name
    FROM full_party
UNION ALL
SELECT 
    avg(full_sunday.valence) AS valence, "sunday" AS table_name
    FROM full_sunday
UNION ALL
SELECT 
    avg(full_studying.valence) AS valence, "studying" AS table_name
    FROM full_studying
UNION ALL
SELECT 
    avg(full_pissed.valence) AS valence, "pissed" AS table_name
    FROM full_pissed
UNION ALL
SELECT  
    avg(full_date_night.valence) AS valence, "date night" AS table_name
    FROM full_date_night
UNION ALL
SELECT 
    avg(full_relaxing_evening.valence) AS valence, "relaxing evening" AS table_name 
    FROM full_relaxing_evening
UNION ALL
SELECT 
    avg(full_barbecue.valence) AS valence, "barbecue" AS table_name
    FROM full_barbecue;