#!/usr/bin/env python
# coding: utf-8

# In[56]:


from pandas import json_normalize
from opencage.geocoder import OpenCageGeocode
from geopy import distance
from geographiclib.geodesic import Geodesic
import pandas as pd
pd.options.display.float_format = '{:,.0f}'.format


# In[59]:


# df = pd.read_csv('..\data\dtd_results_17-19.csv')


# # In[63]:


# df['city'] = df['city'].fillna('unknown')


# In[65]:




# In[73]:


def find_distance(A,B):
    key = '0e05919b28fc4b2a8761d27abf8c017e'  # get api key from:  https://opencagedata.com
    from opencage.geocoder import OpenCageGeocode
    from geopy import distance
    from geographiclib.geodesic import Geodesic

    geocoder = OpenCageGeocode(key)
        
    Geo = Geodesic.WGS84 
    
    
    result_A = geocoder.geocode(A)
    lat_A = result_A[0]['geometry']['lat']
    lng_A = result_A[0]['geometry']['lng']
    
    try: 
        result_B = geocoder.geocode(B)
        lat_B = result_B[0]['geometry']['lat']
        lng_B = result_B[0]['geometry']['lng']  

        d = Geo.Inverse(lat_A, lng_A,  lat_B, lng_B)
        return d['s12']
    except IndexError:
        return None
        
                                    


# In[75]:


def get_distances(location_A,lst):

    df = pd.DataFrame()
    for B in lst:
        dist = find_distance(location_A,B)

        d = {'City' : B,
             'distance' : dist}

        df = df.append(d,ignore_index=True)
    return df    


# In[ ]:


