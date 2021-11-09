create table full_party AS 
    SELECT  features_party.danceability, features_party.energy, features_party.loudness, features_party.speechiness, features_party.acousticness, features_party.instrumentalness, features_party.liveness, features_party.valence, features_party.tempo, party.artistId, party.artistName, party.trackName, party.trackId, party.albumName, party.albumId 
    FROM features_party 
    JOIN party 
    ON features_party.id = party.trackId;

