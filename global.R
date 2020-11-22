"A:/Google Drive/CursoR/Tareas/Trabajo_final_R"


library(readxl)
library(shiny)
library(shinythemes)
library(foreign)
library(highcharter)
library(forecast)
library(dplyr)


bd<-read_excel("base_pensiones.xlsx")
xx<-c("a","b","c")

#MAPA
mapdata <- get_data_from_map(download_map_data("countries/ec/ec-all"))
glimpse(mapdata)

data_ecuador <- mapdata %>% 
  select(PROVINCIA = `hc-a2`) %>% 
  mutate(X = 1:25)
glimpse(data_ecuador)



#a<-levels(d1)
#a
#str(d1)


