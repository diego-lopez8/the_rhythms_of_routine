create table full_date_night AS 
    SELECT  features_date_night.danceability, features_date_night.energy, features_date_night.loudness, features_date_night.speechiness, features_date_night.acousticness, features_date_night.instrumentalness, features_date_night.liveness, features_date_night.valence, features_date_night.tempo, date_night.artistId, date_night.artistName, date_night.trackName, date_night.trackId, date_night.albumName, date_night.albumId 
    FROM features_date_night 
    JOIN date_night 
    ON features_date_night.id = date_night.trackId;

