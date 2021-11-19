create table full_traffic_jam AS 
    SELECT  features_traffic_jam.danceability, features_traffic_jam.energy, features_traffic_jam.loudness, features_traffic_jam.speechiness, features_traffic_jam.acousticness, features_traffic_jam.instrumentalness, features_traffic_jam.liveness, features_traffic_jam.valence, features_traffic_jam.tempo, traffic_jam.artistId, traffic_jam.artistName, traffic_jam.trackName, traffic_jam.trackId, traffic_jam.albumName, traffic_jam.albumId 
    FROM features_traffic_jam 
    JOIN traffic_jam 
    ON features_traffic_jam.id = traffic_jam.trackId;

