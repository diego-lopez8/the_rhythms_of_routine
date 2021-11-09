create table full_relaxing_evening AS 
    SELECT  features_relaxing_evening.danceability, features_relaxing_evening.energy, features_relaxing_evening.loudness, features_relaxing_evening.speechiness, features_relaxing_evening.acousticness, features_relaxing_evening.instrumentalness, features_relaxing_evening.liveness, features_relaxing_evening.valence, features_relaxing_evening.tempo, relaxing_evening.artistId, relaxing_evening.artistName, relaxing_evening.trackName, relaxing_evening.trackId, relaxing_evening.albumName, relaxing_evening.albumId 
    FROM features_relaxing_evening 
    JOIN relaxing_evening 
    ON features_relaxing_evening.id = relaxing_evening.trackId;

