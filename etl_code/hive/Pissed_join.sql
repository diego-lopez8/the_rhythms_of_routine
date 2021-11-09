create table full_pissed AS 
    SELECT  features_pissed.danceability, features_pissed.energy, features_pissed.loudness, features_pissed.speechiness, features_pissed.acousticness, features_pissed.instrumentalness, features_pissed.liveness, features_pissed.valence, features_pissed.tempo, pissed.artistId, pissed.artistName, pissed.trackName, pissed.trackId, pissed.albumName, pissed.albumId 
    FROM features_pissed 
    JOIN pissed 
    ON features_pissed.id = pissed.trackId;

