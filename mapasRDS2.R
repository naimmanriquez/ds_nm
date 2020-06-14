## Librerias a utilizar
library(osmdata)
library(sf)
library(ggplot2)
library(tidyverse)
library(ggmap)
library(dplyr)

## Segunda forma para hacer mapas

## Seguimos con las caracteristicas
## https://wiki.openstreetmap.org/wiki/Map_Features
## https://www.openstreetmap.org/export#map=12/23.2451/-106.3439

## Todo Mazatlan 
## Nota: es importante saber que las coordenadas se ponen oeste/sur/este/norte

maza_1 = opq(bbox = c( -106.5042,23.1719, -106.3480 ,23.3177)) %>%
  add_osm_feature(key = "highway") %>%
  osmdata_sf() 

maza_2 = opq(bbox = c( -106.5042,23.1719, -106.3480 ,23.3177)) %>%
  add_osm_feature(key = "leisure", value = "park") %>%
  osmdata_sf() 

## Crea un objeto con todos los edificios, casas, departamentos

building = opq(bbox = c( -106.5042,23.1719, -106.3480 ,23.3177)) %>%
  add_osm_feature(key = "building") %>%
  osmdata_sf()

bares = opq(bbox = c( -106.5042,23.1719, -106.3480 ,23.3177)) %>%
  add_osm_feature(key = "amenity", value = "bar") %>%
  osmdata_sf() 

maza_vias = maza_1$osm_lines %>% select(highway) %>% st_transform(4326)
maza_park = maza_2$osm_polygons %>% select(leisure) %>% st_transform(4326)
maza_edificios = building$osm_polygons %>% select(name) %>% st_transform(4326)
bares_p = bares$osm_points %>% select(name) %>% st_transform(4326)
tiendas_p = bares_p[!is.na(bares_p$name),]

edificios_p = st_centroid(maza_edificios)

ggplot() + 
  geom_sf(data = maza_vias, col = "black", size= 0.1) + 
  geom_sf(data = maza_park, fill = "darkgreen")+
  geom_sf(data = maza_edificios, fill = "orange")+
  geom_sf(data = bares_p, col= "red", size =5, alpha = 0.4)+
  coord_sf(xlim = c(-106.5042, -106.3480) , ylim = c(23.1719, 23.3177))+
  theme_classic()

# Comando para borrar todo

rm(list = ls())

## Librerias a utilizar
library(osmdata)
library(sf)
library(ggplot2)
library(tidyverse)
library(ggmap)

## Centro Historico de Mazatlan

maza_1 = opq(bbox = c( -106.4349,23.1860, -106.4065 ,23.2107)) %>%
  add_osm_feature(key = "highway") %>%
  osmdata_sf() 

maza_2 = opq(bbox = c( -106.4349,23.1860, -106.4065 ,23.2107)) %>%
  add_osm_feature(key = "leisure", value = "park") %>%
  osmdata_sf() 

building = opq(bbox = c( -106.4349,23.1860, -106.4065 ,23.2107)) %>%
  add_osm_feature(key = "building") %>%
  osmdata_sf()

bares = opq(bbox = c( -106.4349,23.1860, -106.4065 ,23.2107)) %>%
  add_osm_feature(key = "amenity", value = "bar") %>%
  osmdata_sf() 

maza_vias = maza_1$osm_lines %>% select(highway) %>% st_transform(4326)
maza_park = maza_2$osm_polygons %>% select(leisure) %>% st_transform(4326)
maza_edificios = building$osm_polygons %>% select(name) %>% st_transform(4326)
bares_p = bares$osm_points %>% select(name) %>% st_transform(4326)
tiendas_p = bares_p[!is.na(bares_p$name),]

edificios_p = st_centroid(maza_edificios)

ggplot() + 
  geom_sf(data = maza_vias, col = "black", size= 0.1) + 
  geom_sf(data = maza_park, fill = "darkgreen")+
  geom_sf(data = maza_edificios, fill = "orange")+
  geom_sf(data = bares_p, col= "red", size =5, alpha = 0.4)+
  coord_sf(xlim = c(-106.4349, -106.4065) , ylim = c(23.1860, 23.2107))+
  theme_classic()