# Crear mapas a través de Open Street Maps
Repositorio público de Naím

Este es un tutorial para hacer mapas a través de Open Street Maps. Lo primero que tienen que hacer es entrar a la página de Open Street Maps:
https://www.openstreetmap.org/

Allí buscan las coordenadas de la ciudad que quieran mapear. Es importante que en el código las escriban: oeste/sur/este/norte. 

Ejemplo:

maza_1 = opq(bbox = c( -106.5042,23.1719, -106.3480 ,23.3177)) %>%
  add_osm_feature(key = "highway") %>%
  osmdata_sf() 
  
Nota: Para buscar los objetos que puedes mapear con OSM, puedes ir al features. Lo más importante es buscar la clave (key) y el value.

https://wiki.openstreetmap.org/wiki/Map_features

En el ejemplo he tomado highway.

Código dentro del repositorio: mapasRDS2
