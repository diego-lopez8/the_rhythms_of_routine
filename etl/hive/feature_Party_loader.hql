create table features_party (index INT, danceability DOUBLE, energy DOUBLE, key DOUBLE, loudness DOUBLE, mode DOUBLE, speechiness DOUBLE, acousticness DOUBLE, instrumentalness DOUBLE, liveness DOUBLE, valence DOUBLE, tempo DOUBLE, type STRING, id STRING, uri STRING, track_href STRING, analytics_url STRING, duration DOUBLE, time_signature DOUBLE)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' STORED AS TEXTFILE;
load data inpath 'hdfs://horton.hpc.nyu.edu:8020/user/dtl310/TSOR/csvs/features_Party.csv' overwrite into table features_party; 
select * from features_party limit 5;
