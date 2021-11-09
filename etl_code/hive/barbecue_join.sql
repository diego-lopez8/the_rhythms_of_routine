create table full_barbecue AS 
    SELECT  features_barbecue.danceability, features_barbecue.energy, features_barbecue.loudness, features_barbecue.speechiness, features_barbecue.acousticness, features_barbecue.instrumentalness, features_barbecue.liveness, features_barbecue.valence, features_barbecue.tempo, barbecue.artistId, barbecue.artistName, barbecue.trackName, barbecue.trackId, barbecue.albumName, barbecue.albumId 
    FROM features_barbecue 
    JOIN barbecue 
    ON features_barbecue.id = barbecue.trackId;

