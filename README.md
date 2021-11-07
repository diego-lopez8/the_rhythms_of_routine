# the_sounds_of_routine

This repository contains the final project for CSUA476 - Processing Big Data for Analytics Applications. 

It serves as a learning experience and demonstration of knowledge using Hadoop Architecture to analyze large quantities of data over a cluster.

# Overview

This project ingests data from Spotify's API involving playlists associated with different, common routine activities that users have made on the platform. The songs from the playlists associated with these keyword identifiers are then concatenated, resulting in a very large dataset of tracks associated with the given activity. 

Cleaning is performed on the data to extract only meaningful columns.

The audio features of these tracks are then analyzed and compared using traditional measures of central tendency, along with statistical tests which we will derrive meaningful results from.

Given the incredible amount of data associated with each keyword (~10,000 songs per category) we hope that meaningful differences (if any) in the audio features will be represented and accounted for. 

