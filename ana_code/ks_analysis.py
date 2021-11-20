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

sparkSession = (SparkSession
                .builder
                .appName('example-pyspark-read-and-write-from-hive')
                .config("hive.metastore.uris", "thrift://localhost:9083", conf=SparkConf())
                .enableHiveSupport()
                .getOrCreate()
                )

sparkSession.sql('use dtl310')

ks_2samp(sparkSession.sql('select * from full_party'), "valence", sparkSession.sql('select * from full_barbecue'), "valence")