
# Check if shape files have been downloaded
if(!file.exists("./zone_shapefiles/apd_NewZone_2011_region.shp")){
     get.apd.data(selector.text = "tr:nth-child(3) a", 
                  save.location = "./zone_shapefiles")
}

create.atlanta.map <- function(map.center = "Atlanta, GA",
                               maptype = "roadmap", map.source = "google",
                               zoom.level = 11){
     map.center <- geocode(map.center)
     Atlanta <- get_map(c(lon=map.center$lon, lat=map.center$lat),
                        zoom = zoom.level, maptype = maptype, source = map.source)
     ggmap(Atlanta)
}

add.zones <- function(){
     require(ggmap)
     require(RgoogleMaps)
     require(rgdal)
     
     # Function to read data from shape file
     read_shapefile_transform <- function(layer){
          readOGR("./zone_shapefiles", layer) %>% 
               spTransform(CRS("+proj=longlat +datum=WGS84")) %>% 
               fortify()
     }
     
     zones <- read_shapefile_transform(layer = "apd_NewZone_2011_region")
     
     # Return a geom_polygon object that can be added to the Atlanta Map
     return(geom_polygon(aes(x = long, y = lat, group = group),
                         fill = "grey", size= 1, color="red", 
                         data = zones, alpha = 0))
}

