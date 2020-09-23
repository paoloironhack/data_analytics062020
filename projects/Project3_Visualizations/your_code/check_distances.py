#!/usr/bin/env python
# coding: utf-8

# In[56]:

from pandas import json_normalize
from opencage.geocoder import OpenCageGeocode
from geopy import distance
from geographiclib.geodesic import Geodesic
import pandas as pd
pd.options.display.float_format = '{:,.0f}'.format
from opencage.geocoder import OpenCageGeocode
from geopy import distance
from geographiclib.geodesic import Geodesic


def get_distances(location_A,lst):
#     key = 'ddd6e78a91d647e6a33da16ae32f5c8f' 
    key = '0e05919b28fc4b2a8761d27abf8c017e'
    geocoder = OpenCageGeocode(key)
    result_A = geocoder.geocode(location_A)
    lat_A = result_A[0]['geometry']['lat']
    lng_A = result_A[0]['geometry']['lng']

    df = pd.DataFrame()
    for B in lst:
        dist = find_distance([lat_A,lng_A],B)

        d = {'city' : B,
             'distance' : dist}

        df = df.append(d,ignore_index=True)
    return df  


def find_distance(A,B):
    key = '0e05919b28fc4b2a8761d27abf8c017e'  # get api key from:  https://opencagedata.com
    # key = 'ddd6e78a91d647e6a33da16ae32f5c8f'
    from opencage.geocoder import OpenCageGeocode
    from geopy import distance
    from geographiclib.geodesic import Geodesic

    geocoder = OpenCageGeocode(key)
        
    Geo = Geodesic.WGS84 
       
    try: 
        result_B = geocoder.geocode(B)
        lat_B = result_B[0]['geometry']['lat']
        lng_B = result_B[0]['geometry']['lng']  

        d = Geo.Inverse(A[0], A[1],  lat_B, lng_B)
        return d['s12']
    except IndexError:
        return None


