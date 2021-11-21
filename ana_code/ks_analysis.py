"""
File: ks_analysis.py
Author: Diego Lopez
Date: 11/19/2021
This file takes the tables loaded from the code in etl/code/ .hql files and performs a KS 2 sample KS test 

"""
from ks_2samp_sparksql import *
from pyspark import SparkContext, SparkConf
from pyspark.conf import SparkConf
from pyspark.sql import SparkSession, HiveContext
from helper import *

sparkSession = (SparkSession
                .builder
                .appName('example-pyspark-read-and-write-from-hive')
                .config("hive.metastore.uris", "thrift://localhost:9083", conf=SparkConf())
                .enableHiveSupport()
                .getOrCreate()
                )

sparkSession.sql('use dtl310')

tables = ["fulL_party", "full_barbecue", "full_relaxing_evening", "full_sunday", "full_pissed", "full_date_night", "full_traffic_jam", "full_studying"]
cols = ["danceability", "energy", "loudness", "speechiness", "acousticness", "instrumentalness", "liveness", "valence", "tempo"]
frames = []


for table in tables:
    for table_rhs in tables:
        if table is not table_rhs:
            frame = KSFrame(table, table_rhs)
            frames.append(frame)
            for col in cols:
                ks_stat, p = ks_2samp(sparkSession.sql(f'select * from {table}'), col, sparkSession.sql(f'select * from {table_rhs}'), col)
                frame.add_stat(col, p, ks_stat)
for frame in frames:
    print(frame, file=open("KSOutput.txt", "a"))