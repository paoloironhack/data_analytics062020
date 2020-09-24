import pandas as pd
from datetime import timedelta
import seaborn as sns
import requests
from bs4 import BeautifulSoup
import matplotlib.pyplot as plt
import numpy as np
import altair as alt

def get_seconds(x):
    try:
        t_split = str(x).split(":")
        delta = timedelta(hours=int(t_split[0]), minutes=int(t_split[1]), seconds=int(t_split[2]))
        total_seconds = delta.total_seconds()
    except ValueError:
        total_seconds = 0
    return total_seconds


def get_names_by_province():
    url = 'https://www.metatopos.eu/almanak.html'
    rows = BeautifulSoup(requests.get(url).text,'html.parser').find('table').find_all('tr')[1:]
    df = pd.DataFrame()
    for row in rows:
        d = {'city' : row.find_all('td')[1].text,
             'province' : row.find_all('td')[4].text,
            }    
        df = df.append(d,ignore_index=True)
    df = df.loc[df['province'] == 'Noord-Holland']    
    return df

def transform_data(df):
#     df = pd.read_csv('../data/dtd_results_17-19.csv')
    df = df.drop_duplicates()
#     df = df.drop(columns='Unnamed: 0')
    df['guntime_in_second'] = df['guntime'].apply(get_seconds)
    df['realtime_in_second'] = df['realtime'].apply(get_seconds)
    
    df['speed'] = df['realtime_in_second'].apply(lambda x: (((16036/x) * 3600)/1000))
    
   
    df = pd.merge(df,get_names_by_province(),how='left',on='city')
    
    df['province'] = df['province'].fillna('Other location')
    
    df['diff_gun_realtime']=(df['guntime_in_second'] - df['realtime_in_second'])
    
    df['sex'] = df['sex'].apply(lambda x: 'Female' if str(x)[0] == 'V' else 'Male')

    bins = list(range(0,24,3)) + [np.inf]
    df['speed_buckets'] = pd.cut(df['speed'],bins=
                                         [i-1 if i > 0 else 0 for i in bins],
                                         labels=['-'.join(map(str,(x,y-1))) for x, y in zip(bins[:-1], bins[1:])])

    return df