# Import packages
from dash import Dash, html, dash_table, dcc, callback, Output, Input,ALL, Patch
import pandas as pd
import numpy as np
import seaborn as sns
import matplotlib.pyplot as plt
import plotly.express as px
from plotly.subplots import make_subplots
import plotly.graph_objects as go
import warnings

# Incorporate data
df = pd.read_csv('../Orginal_database_from_Kaggle/Final database.csv', usecols=['Country', 'Popularity', 'Genre'])
df_1 = pd.read_csv('../Orginal_database_from_Kaggle/Final database.csv', usecols=['Country', 'Genre', 'Artist','Title','Album','Cluster','Popularity','Artist_followers'],low_memory=False)
df = df.replace('n-a', np.nan)
df = df.dropna()
df_1 = df_1.replace('n-a', np.nan)
df_1 = df_1.dropna()
drop_index_cl = df_1[df_1.Cluster == 'global'].index
drop_index_c = df[df.Country == 'Global'].index
df.drop(drop_index_c,inplace=True)
df_1.drop(drop_index_cl,inplace=True)
poland_counts = df.query('Country == "Poland"')['Genre'].value_counts().nlargest(10)
turkey_counts = df.query('Country == "Turkey"')['Genre'].value_counts().nlargest(10)
ecuador_counts = df.query('Country == "Ecuador"')['Genre'].value_counts().nlargest(10)
#Adding extra data set to use in plotly for interpetation country
df_country_iso = pd.read_csv(r'..\Country_ISO\countries_codes_and_coordinates.csv') 
df_country_iso = df_country_iso.replace('"','', regex=True) 
df_country_iso = df_country_iso.replace('United Kingdom', 'UK') # adjustiing to data in Spotyfia dataset

kraj = list(df_country_iso['Country']) #wyciągnięcie krajów z iso
iso = list(df_country_iso['Alpha-3 code']) #wyciągnięcie skrótów krajów z iso
dict = {}
iso = [x.strip(' ') for x in iso] # usnięcie spacji ze skrótów kodów
for i,j in zip(kraj,iso): # tworznie słownika na bazie którego zostanie zapełniona kolumna iso_alpha z df
    dict.setdefault(i,j)

df['iso_alpha'] = df['Country'] #dodanie kolmuny iso_alpha z wartościami Country aby dokonać podmiany na trzy literowen zonaczenie

df.replace({"iso_alpha": dict},inplace=True) # podmiana wartosci iso_alpha na ich odpowiednik 3 literowy potrzbne do wykrzystania w plotly do wyświetlania potrzbenych krajów
# mean to show on map
by_country = df.groupby('iso_alpha')['Popularity'].mean().reset_index().rename(columns={'iso_alpha': 'Country','Popularity':'Mean_Popularity'})
country_list = by_country
# Initialize the app
app = Dash(__name__)

# App layout
app.layout = html.Div([
    html.Div(className='row', children='My First App with Data, Graph, and Controls',
             style={'textAlign': 'center', 'color': 'blue', 'fontSize': 30}),
    dcc.Graph(figure=px.bar(x=poland_counts.index, y=poland_counts,title="Poland")),
    dcc.Graph(figure=px.bar(x=turkey_counts.index, y=turkey_counts,title="Turkey")),
    dcc.Graph(figure=px.bar(x=ecuador_counts.index, y=ecuador_counts,title="Ecuador")),
    dcc.Graph(figure=px.choropleth(country_list, locations='Country',
                        color='Mean_Popularity', # lifeExp is a column of gapminder
                        hover_name='Country', # column to add to hover information
                        color_continuous_scale=px.colors.sequential.Rainbow,
                        width=800,
                        height=800,
                        projection = 'mercator'))
])

# Run the app
if __name__ == '__main__':
    app.run_server(debug=True)