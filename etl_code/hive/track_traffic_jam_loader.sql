create table traffic_jam (artistName STRING, artistID STRING, albumName STRING, albumID STRING, trackName STRING, trackID STRING)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' STORED AS TEXTFILE;
load data inpath 'hdfs://horton.hpc.nyu.edu:8020/user/dtl310/TSOR/csvs/clean_tracks_traffic_jam.csv' overwrite into table features_traffic_jam; 
select * from traffic_jam limit 5;