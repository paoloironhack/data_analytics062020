#!/usr/bin/env python
# coding: utf-8

# In[1]:


import requests
import pandas as pd
import numpy as np
from bs4 import BeautifulSoup
from time import mktime
import time
import re
from io import StringIO
from datetime import datetime, timedelta
import matplotlib.pyplot as plt
import selenium
from selenium import webdriver
from selenium.webdriver.common.action_chains import ActionChains
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.common.exceptions import TimeoutException
import time
from selenium.webdriver.chrome.options import Options
options = Options()
# wait = WebDriverWait(driver, 20)
import os
from selenium import webdriver
from selenium.webdriver.support.ui import Select


# In[16]:


# In[17]:


def getdtdtimes(races,pages):    
    df_allruns = pd.DataFrame()
    driver = webdriver.Chrome('./chromedriver_win32/chromedriver.exe')
    for key,values in races.items():
        lst_time = []

        lst_realtime = []

        lst_city = []

        lst_gender = [] 

        lst_numbers = []

        page = []

        driver.get(values)

        for i in range(pages):

            time.sleep(2)
            html = driver.execute_script("return document.body.innerHTML;")

            soup = BeautifulSoup(html,'html.parser').find('tbody').find_all('tr',{'class':'add-arrow pointer ng-scope'})

            rows = BeautifulSoup(str(soup),'html.parser').find_all('td',{'class':'col-is-guntime is-narrow'})

            numbers= BeautifulSoup(str(soup),'html.parser').find_all('td',{'class':'col-is-bib color-grey-light is-narrow ng-binding ng-scope'})

            realtime = BeautifulSoup(str(soup),'html.parser').find_all('td',{'class':'col-is-time is-narrow ng-scope'})

            cities = BeautifulSoup(str(soup),'html.parser').find_all('td',{'class':'col-is-category color-grey-light is-wide ng-binding'})

            gender = BeautifulSoup(str(soup),'html.parser').find_all('td',{'class':'col-is-category color-grey-light is-wide'})

            lst = [city.text for city in cities]
            lst2 = [row.text for row in rows]
            lst3 = [sex.text for sex in gender]
            lst4 = [real.text for real in realtime]
            lst5 = [number.text for number in numbers]

            lst_city = lst_city + lst
            lst_time= lst_time + lst2
            lst_gender = lst_gender + lst3
            lst_realtime = lst_realtime + lst4
            lst_numbers = lst_numbers +lst5


            time.sleep(1)
            try: 
                driver.find_element_by_xpath('/html/body/div[4]/section/div[3]/div/div/div[3]/div/div/ul/li[11]/a').click()
                time.sleep(1)  
            except StaleElementReferenceException:
                driver.find_element_by_xpath('/html/body/div[4]/section/div[3]/div/div/div[3]/div/div/ul/li[11]/a').click()
                time.sleep(1)

        try: 
            df_results = pd.DataFrame({'sex':lst_gender,'city':lst_city,'guntime':lst_time,'realtime':lst_realtime,'BIB':lst_numbers})
            df_results['year'] = key
        except ValueError:
            df_results = pd.DataFrame({'sex':lst_gender,'city':['unknown' for i in list(range(0,len(lst_realtime),1))]
                                       ,'guntime':lst_realtime,'realtime':lst_realtime,'BIB':lst_numbers})
            df_results['year'] = key
        df_allruns = pd.concat([df_allruns,df_results])
        df_allruns = df_allruns.drop_duplicates()
    return df_allruns