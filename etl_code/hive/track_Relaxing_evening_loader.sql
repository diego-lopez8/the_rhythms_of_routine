create table relaxing_evening (artistName STRING, artistID STRING, albumName STRING, albumID STRING, trackName STRING, trackID STRING)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' STORED AS TEXTFILE;
load data inpath 'hdfs://horton.hpc.nyu.edu:8020/user/dtl310/TSOR/csvs/clean_tracks_Relaxing_evening.csv' overwrite into table relaxing_evening; 
select * from relaxing_evening limit 5;