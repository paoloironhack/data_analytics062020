![Ironhack logo](https://i.imgur.com/1QgrNNw.png)

# Lab | Data Cleaning

## Introduction

We keep seeing a common phrase that 80% of the work of a data scientist is data cleaning. We have no idea whether this number is accurate but a data scientist indeed spends lots of time and effort in collecting, cleaning and preparing the data for analysis. This is because datasets are usually messy and complex in nature. It is a very important ability for a data scientist to refine and restructure datasets into a usable state in order to proceed to the data analysis stage.

In this exercise, you will both practice the data cleaning techniques we discussed in the lesson and learn new techniques by looking up documentations and references. You will work on your own but remember the teaching staff is at your service whenever you encounter problems.

## Goals

Do you remember your MySQL project? In this lab, you will examine some MySQL tables from [here](https://relational.fit.cvut.cz/dataset/Stats). This database contains an anonymized dump of all user-contributed content on the Stats Stack Exchange network.

You will need to import the `pymysql` library and the `create_engine` function from the `sqlalchemy` library.

```python
import pymysql
from sqlalchemy import create_engine
```

Once your connection is established with the database you will use some basic SELECT queries to retrieve the data in order to answer the questions described next.

:bulb: If you receive import errors for `pymysql` or `sqlalchemy`, it means you need to install them with `pip`.


## Deliverables

- `main.ipynb` with your responses to each of the questions.

## Resources

[Data Cleaning with Numpy and Pandas](https://realpython.com/python-data-cleaning-numpy-pandas/#python-data-cleaning-recap-and-resources)

[Data Cleaning Video](https://www.youtube.com/watch?v=ZOX18HfLHGQ)

[Data Preparation](https://www.kdnuggets.com/2017/06/7-steps-mastering-data-preparation-python.html)

[Google Search](https://www.google.es/search?q=how+to+clean+data+with+python)