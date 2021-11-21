use dtl310;
SELECT 
    avg(full_traffic_jam.valence) AS valence, 
    avg(full_traffic_jam.danceability) AS danceability, 
    avg(full_traffic_jam.energy) AS energy,
    avg(full_traffic_jam.loudness) AS loudness,
    avg(full_traffic_jam.speechiness) AS speechiness,
    avg(full_traffic_jam.acousticness) AS acousticness,
    avg(full_traffic_jam.instrumentalness) AS instrumentalness,
    avg(full_traffic_jam.liveness) AS liveness,
    "traffic jam" AS table_name 
    FROM full_traffic_jam
UNION ALL 
SELECT 
    avg(full_party.valence) AS valence, 
    avg(full_party.danceability) AS danceability, 
    avg(full_party.energy) AS energy,
    avg(full_party.loudness) AS loudness,
    avg(full_party.speechiness) AS speechiness,
    avg(full_party.acousticness) AS acousticness,
    avg(full_party.instrumentalness) AS instrumentalness,
    avg(full_party.liveness) AS liveness,
    "party" AS table_name
    FROM full_party
UNION ALL
SELECT 
    avg(full_sunday.valence) AS valence, 
    avg(full_sunday.danceability) AS danceability, 
    avg(full_sunday.energy) AS energy,
    avg(full_sunday.loudness) AS loudness,
    avg(full_sunday.speechiness) AS speechiness,
    avg(full_sunday.acousticness) AS acousticness,
    avg(full_sunday.instrumentalness) AS instrumentalness,
    avg(full_sunday.liveness) AS liveness,
    "sunday" AS table_name
    FROM full_sunday
UNION ALL
SELECT 
    avg(full_studying.valence) AS valence, 
    avg(full_studying.danceability) AS danceability, 
    avg(full_studying.energy) AS energy,
    avg(full_studying.loudness) AS loudness,
    avg(full_studying.speechiness) AS speechiness,
    avg(full_studying.acousticness) AS acousticness,
    avg(full_studying.instrumentalness) AS instrumentalness,
    avg(full_studying.liveness) AS liveness,
    "studying" AS table_name
    FROM full_studying
UNION ALL
SELECT 
    avg(full_pissed.valence) AS valence, 
    avg(full_pissed.danceability) AS danceability, 
    avg(full_pissed.energy) AS energy,
    avg(full_pissed.loudness) AS loudness,
    avg(full_pissed.speechiness) AS speechiness,
    avg(full_pissed.acousticness) AS acousticness,
    avg(full_pissed.instrumentalness) AS instrumentalness, 
    avg(full_pissed.liveness) AS liveness,
    "pissed" AS table_name
    FROM full_pissed
UNION ALL
SELECT  
    avg(full_date_night.valence) AS valence, 
    avg(full_date_night.danceability) AS danceability, 
    avg(full_date_night.energy) AS energy,
    avg(full_date_night.loudness) AS loudness,
    avg(full_date_night.speechiness) AS speechiness,
    avg(full_date_night.acousticness) AS acousticness,
    avg(full_date_night.instrumentalness) AS instrumentalness, 
    avg(full_date_night.liveness) AS liveness,
    "date night" AS table_name
    FROM full_date_night
UNION ALL
SELECT 
    avg(full_relaxing_evening.valence) AS valence, 
    avg(full_relaxing_evening.danceability) AS danceability, 
    avg(full_relaxing_evening.energy) AS energy,
    avg(full_relaxing_evening.loudness) AS loudness,
    avg(full_relaxing_evening.speechiness) AS speechiness,    
    avg(full_relaxing_evening.acousticness) AS acousticness,
    avg(full_relaxing_evening.instrumentalness) AS instrumentalness,
    avg(full_relaxing_evening.liveness) AS liveness,
    "relaxing evening" AS table_name 
    FROM full_relaxing_evening
UNION ALL
SELECT 
    avg(full_barbecue.valence) AS valence, 
    avg(full_barbecue.danceability) AS danceability, 
    avg(full_barbecue.energy) AS energy,
    avg(full_barbecue.loudness) AS loudness,
    avg(full_barbecue.speechiness) AS speechiness,
    avg(full_barbecue.acousticness) AS acousticness,
    avg(full_barbecue.instrumentalness) AS instrumentalness,
    avg(full_barbecue.liveness) AS liveness,
    "barbecue" AS table_name
    FROM full_barbecue;