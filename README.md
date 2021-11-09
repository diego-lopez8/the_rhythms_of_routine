# the_sounds_of_routine

This repository contains the final project for CSUA476 - Processing Big Data for Analytics Applications. 

It serves as a learning experience and demonstration of knowledge using Hadoop Architecture to analyze large quantities of data over a cluster.

# Overview

This project ingests data from Spotify's API involving playlists associated with different, common routine activities that users have made on the platform. The songs from the playlists associated with these keyword identifiers are then concatenated, resulting in a very large dataset of tracks associated with the given activity. 

Cleaning is performed on the data to extract only meaningful columns.

The audio features of these tracks are then analyzed and compared using traditional measures of central tendency, along with statistical tests which we will derrive meaningful results from.

Given the incredible amount of data associated with each keyword (~10,000 songs per category) we hope that meaningful differences (if any) in the audio features will be represented and accounted for. 

# Ingestion log of execution

OAuth token was generated from registering at Spotify's developer portal 

playlist_csv_generator.py was run to generate 8 csv files of the various routine keywords to be analyzed. Each file contains metadata for around 100 playlists related to the keyword.

tracklist_generator.py was run immidiately following. This file reads the csv files generated from the previous script and using the playlist ID, generates track metadata and track audio features (2 different api calls) and places them into CSVS. We note that spotify returns results for tracks even if they are local-only and do not have audio features generated, hence these 2 files will not be entirely the same. 

Final result of this stage should be 16 csvs, 8 track data csvs and 8 features data csvs. The original playlist metadata csvs may be stashed and will not be used further.

# ETL log of execution

All csvs were placed onto NYU Peel HPC Hadoop cluster. The location used was "dtl310/TSOR/csvs" 

The data was profiled using the compiled MR job in profiling_code/

The 8 track metadata csvs were cleaned using the compiled MR job in etl_code/ . This reduced the number of columns and extracted 6 listed below: 

    artistID

    artistName

    albumID

    albumName

    trackID

    trackName

and placed into a new csv. 

These csvs were loaded into hive using the track_KEYWORD_loader.sql files located in etl_code/hive/

The uncleaned features data were loaded into hive using the feature_KEYWORD_loader.sql files located in etl_code/hive/

16 tables were created in total.

The 2 tables were then joined and inserted in a new table using the KEYWORD_join.sql files in etl_code/hive/

In this same step, the audio features data was cleaned as we only selected certain columns to be inserted to the new table on the join. The new schema for the full joined table is:

    features_KEYWORD.danceability
    features_KEYWORD.energy 
    features_KEYWORD.loudness
    features_KEYWORD.speechiness
    features_KEYWORD.acousticness
    features_KEYWORD.instrumentalness
    features_KEYWORD.liveness
    features_KEYWORD.valence
    features_KEYWORD.tempo
    KEYWORD.artistId
    KEYWORD.artistName
    KEYWORD.trackName
    KEYWORD.trackId
    KEYWORD.albumName
    KEYWORD.albumId 


