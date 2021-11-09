create table full_sunday AS 
    SELECT  features_sunday.danceability, features_sunday.energy, features_sunday.loudness, features_sunday.speechiness, features_sunday.acousticness, features_sunday.instrumentalness, features_sunday.liveness, features_sunday.valence, features_sunday.tempo, sunday.artistId, sunday.artistName, sunday.trackName, sunday.trackId, sunday.albumName, sunday.albumId 
    FROM features_sunday 
    JOIN sunday 
    ON features_sunday.id = sunday.trackId;

