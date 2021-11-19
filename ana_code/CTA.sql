use dtl310;
SELECT 
    avg(full_traffic_jam.valence) AS valence, 
    avg(full_traffic_jam.danceability) AS danceability, 
    avg(full_traffic_jam.energy) AS energy,
    avg(full_traffic_jam.loudness) AS loudness,
    "traffic jam" AS table_name 
    FROM full_traffic_jam
UNION ALL 
SELECT 
    avg(full_party.valence) AS valence, 
    avg(full_party.danceability) AS danceability, 
    avg(full_party.energy) AS energy,
    avg(full_party.loudness) AS loudness,
    "party" AS table_name
    FROM full_party
UNION ALL
SELECT 
    avg(full_sunday.valence) AS valence, 
    avg(full_sunday.danceability) AS danceability, 
    avg(full_sunday.energy) AS energy,
    avg(full_sunday.loudness) AS loudness,
    "sunday" AS table_name
    FROM full_sunday
UNION ALL
SELECT 
    avg(full_studying.valence) AS valence, 
    avg(full_studying.danceability) AS danceability, 
    avg(full_studying.energy) AS energy,
    avg(full_studying.loudness) AS loudness,
    "studying" AS table_name
    FROM full_studying
UNION ALL
SELECT 
    avg(full_pissed.valence) AS valence, 
    avg(full_pissed.danceability) AS danceability, 
    avg(full_pissed.energy) AS energy,
    avg(full_pissed.loudness) AS loudness,
    "pissed" AS table_name
    FROM full_pissed
UNION ALL
SELECT  
    avg(full_date_night.valence) AS valence, 
    avg(full_date_night.danceability) AS danceability, 
    avg(full_date_night.energy) AS energy,
    avg(full_date_night.loudness) AS loudness,
    "date night" AS table_name
    FROM full_date_night
UNION ALL
SELECT 
    avg(full_relaxing_evening.valence) AS valence, 
    avg(full_relaxing_evening.danceability) AS danceability, 
    avg(full_relaxing_evening.energy) AS energy,
    avg(full_relaxing_evening.loudness) AS loudness,
    "relaxing evening" AS table_name 
    FROM full_relaxing_evening
UNION ALL
SELECT 
    avg(full_barbecue.valence) AS valence, 
    avg(full_barbecue.danceability) AS danceability, 
    avg(full_barbecue.energy) AS energy,
    avg(full_barbecue.loudness) AS loudness,
    "barbecue" AS table_name
    FROM full_barbecue;