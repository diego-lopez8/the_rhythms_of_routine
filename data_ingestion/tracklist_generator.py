"""
Author: Diego Lopez
Date: 10/25/2021
This file contains the code needed to generate the complete tracklists from the playlist csvs.
This file takes a csv of playlists and outputs a csv of the complete concatenated tracklists of these playlists
This requires a first run of playlist_csv_generator.py 
"""
import spotipy
from spotipy.oauth2 import SpotifyOAuth
from dotenv import load_dotenv
import json
import pandas as pd 
import numpy as np 
import os
load_dotenv()
client_id     = os.getenv("SPOTIFY_CLIENT_ID")
client_secret = os.getenv("SPOTIFY_CLIENT_SECRET")
redirect_uri  = os.getenv("REDIRECT_URI")
scope = 'user-top-read'

sp = spotipy.Spotify(auth_manager=SpotifyOAuth(scope=scope, client_id=client_id, client_secret=client_secret, redirect_uri=redirect_uri))

def main():
    directory = os.listdir()
    csvs = [elem for elem in directory if ".csv" in elem]
    for csv in csvs:
        print("generating features and tracks for  ", csv)
        playlist_df              = pd.read_csv(csv)
        total_tracklist          = []
        total_tracklist_features = []

        for i in range(len(playlist_df)):
            print("Generating tracks for playlist:", playlist_df.iloc[i,4])
            user        = playlist_df.iloc[i, -3]
            playlist_id = playlist_df.iloc[i, 4]
            results     = get_playlist_tracks(user, playlist_id)
            results_df  = pd.json_normalize(results)
            tids        = []
            total_tracklist.extend(results)
            for elem in results_df["track.uri"]:
                tids.append(elem)
            nanDeleter(tids)

            features = batch_audio_features(tids)
            total_tracklist_features.extend(features)

        total_tracklist_df          = pd.json_normalize(total_tracklist)
        total_tracklist_features_df = pd.json_normalize(total_tracklist_features)
        total_tracklist_df.to_csv(f"tracks_{csv}")
        total_tracklist_features_df.to_csv(f"features_{csv}")

def nanDeleter(lst):
    i = 0
    while i < len(lst):
        if lst[i] is pd.np.nan:
            lst.pop(i)
            i -= 1
        i += 1

def get_playlist_tracks(username,playlist_id):
    results = sp.user_playlist_tracks(username,playlist_id)
    tracks = results['items']
    while results['next']:
        results = sp.next(results)
        tracks.extend(results['items'])
    return tracks

def batch_audio_features(id_lst):
    if len(id_lst) <= 100: 
        features = sp.audio_features(id_lst)
        return features
    else:
        id_len   = len(id_lst)
        curr_pos = 0
        features = []
        while id_len > 100:
            feature_page = sp.audio_features(id_lst[curr_pos: curr_pos+100])
            features.extend(feature_page)
            curr_pos += 100
            id_len  -= 100
        if id_len > 0:
            feature_page = sp.audio_features(id_lst[curr_pos: curr_pos + id_len])
            features.extend(feature_page)
        return features

if __name__=="__main__":
   main()