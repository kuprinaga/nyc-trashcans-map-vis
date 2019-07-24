library(lettercase)
library(tidyverse)
library(leaflet)
library(mapview)
library(webshot)
library(htmlwidgets)
library(htmltools)
library(magrittr)

source('./get_data.R')
names(df) %<>% make_names()

tag.map.title <- tags$style(HTML("
  .leaflet-control.map-title { 
   background: rgba(255,255,255,0.9);
    font-weight: bold;
    font-size: 30px;
  }
"))

title <- tags$div(
  tag.map.title, HTML("NYC Public Recycling bins, data for 09.2018")
)  


m <- leaflet() %>%
  addTiles() %>%
  setView(-73.95, 40.76, zoom = 10.5) %>%
  addProviderTiles("Stamen.TonerLite") %>%
  addCircleMarkers(
    data = df, ~Longitude, ~Latitude,
    radius = 4,
    color = 'blue',
    stroke = FALSE, 
    fillOpacity = 0.5,
    popup = glue('Located at {df$Park_Site_Name}, {df$Borough}')
  ) %>%
  addControl(title, position = "topleft", className="map-title")

# thanks to https://stackoverflow.com/questions/49072510/r-add-title-to-leaflet-map


saveWidget(m, "map.html", selfcontained = FALSE)

webshot("map.html", file = "Rplot.png",
        cliprect = "viewport")

