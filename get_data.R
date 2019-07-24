## data and its description can be found here: 
## https://data.cityofnewyork.us/Environment/Public-Recycling-Bins/sxx4-xhzg

df <- readr::read_csv('https://data.cityofnewyork.us/api/views/sxx4-xhzg/rows.csv?accessType=DOWNLOAD')

readr::write_csv(df, 'trashcans.csv')