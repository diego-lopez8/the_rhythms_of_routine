create table full_studying AS 
    SELECT  features_studying.danceability, features_studying.energy, features_studying.loudness, features_studying.speechiness, features_studying.acousticness, features_studying.instrumentalness, features_studying.liveness, features_studying.valence, features_studying.tempo, studying.artistId, studying.artistName, studying.trackName, studying.trackId, studying.albumName, studying.albumId 
    FROM features_studying 
    JOIN studying 
    ON features_studying.id = studying.trackId;

