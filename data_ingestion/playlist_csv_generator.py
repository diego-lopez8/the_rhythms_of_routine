# playlist_csv_generator.py
"""
Author: Diego Lopez
Date: 10/23/2021
This file contains the code to generate CSV files of the various playlists associated with the appropriate terms
This file should be considered a pre-requisite to the file that generates the tracklist from each playlist and the associated features of those tracks
"""

import spotipy
from spotipy.oauth2 import SpotifyOAuth
from dotenv import load_dotenv
import json
import pandas as pd 
import os
import numpy as np 
load_dotenv()
client_id     = os.getenv("SPOTIFY_CLIENT_ID")
client_secret = os.getenv("SPOTIFY_CLIENT_SECRET")
redirect_uri  = os.getenv("REDIRECT_URI")
scope = 'user-top-read'
sp    = spotipy.Spotify(auth_manager=SpotifyOAuth(scope=scope, client_id=client_id, client_secret=client_secret, redirect_uri=redirect_uri))

def main():
    search_terms = ["Party", "Barbecue", "Sunday", "Studying", "traffic jam", "Relaxing evening", "pissed", "Date Night"]
    for search_term in search_terms:
        results           = sp.search(search_term, type="playlist", limit=50)
        results_page1_df  = pd.json_normalize(results["playlists"]['items'])
        results_offset_50 = sp.search(search_term, type="playlist", limit=50, offset=50)
        results_page2_df  = pd.json_normalize(results_offset_50["playlists"]['items'])
        results_full      = pd.concat([results_page1_df, results_page2_df], ignore_index=True)
        search_term = search_term.replace(" ", "_")
        results_full.to_csv(f"{search_term}.csv")
    
if __name__=="__main__":
   main()