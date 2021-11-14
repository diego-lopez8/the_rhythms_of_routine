-- this file is the depreciated version of valence_union_avg.sql as it runs extremely slow...
use dtl310;
SELECT 
    avg(full_traffic_jam.valence) AS Traffic_jam_valence, 
    avg(full_party.valence) AS Party_valence,
    avg(full_sunday.valence) AS Sunday_valence, 
    avg(full_studying.valence) AS Studying_valence,
    avg(full_pissed.valence) AS Pissed_valence, 
    avg(full_date_night.valence) AS Date_night_valence, 
    avg(full_relaxing_evening.valence) AS Relaxing_evening_valence,
    avg(full_barbecue.valence) AS Barbecue_valence
    from full_barbecue, full_traffic_jam, full_party, full_sunday, full_studying, full_pissed, full_date_night, full_relaxing_evening;
