import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

def acquire(path_and_filename):
    df = pd.read_csv(path_and_filename)
    return df

def get_user_input():
    year_start = int(input('Enter the from year:'))
    year_end   = int(input('Enter the to year:'))
    return (year_start, year_end)

# returns a dataframe for the year specified
def wrangle(df, year):
    filter_idx = (df.Year==year)
    df         = df[filter_idx]
    return df

def analyze(df):
    #group by
    df = df.groupby('Make').agg({'Combined MPG':'mean'}).reset_index()
    #sort on fuel eff
    df = df.sort_values(by='Combined MPG', ascending=False).head(10)
    return df

def report(df_fuel_eff_by_make, year):
    fig, ax = plt.subplots(figsize=(15,8))
    barchart = sns.barplot(data=df_fuel_eff_by_make, x='Make', y='Combined MPG')
    plt.title(f'Top 10 fuel efficient Makes in {year}', fontsize=16)
    return barchart

def save_report(barchart1, year):
    fig = barchart1.get_figure()
    fig.savefig(f'Top10_{year}.png')
    return

if __name__ == '__main__':

	path_and_filename = 'data/vehicles.csv'
	df_original = acquire(path_and_filename)
	(year_start, year_end) = get_user_input()

	for current_year in range(year_start, year_end+1):
		print('reporting and saving year :', current_year)
		df        = wrangle(df_original, current_year)
		
		if df.empty:
			print('No report possible, no cars present for year:',current_year)     
		else:
			df        = analyze(df)
			barchart1 = report(df, current_year)
			save_report(barchart1, current_year) 
