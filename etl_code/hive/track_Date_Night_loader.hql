create table date_night (artistName STRING, artistID STRING, albumName STRING, albumID STRING, trackName STRING, trackID STRING)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' STORED AS TEXTFILE;
load data inpath 'hdfs://horton.hpc.nyu.edu:8020/user/dtl310/TSOR/csvs/clean_tracks_Date_Night.csv' overwrite into table barbecue; 
select * from date_night limit 5;