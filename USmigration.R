#install.packages(c("threejs", "maps", "readr"))
library("threejs")
library("maps")
library("readr")
library("dplyr")
#uploading input datasets retrieved from International Migration Database https://stats.oecd.org/Index.aspx?DataSetCode=MIG
migration <- read_csv("/Users/A_Dmitriyeva/Downloads/migration.csv")
latlon <- read_csv("/Users/A_Dmitriyeva/Downloads/latlon.csv")
us <- read_csv("/Users/A_Dmitriyeva/Downloads/us.csv")
#data preprocessing
input <- left_join(us, latlon, by = c('destination'))
input <- as.vector(as.matrix(input[,c("latitude", "longitude")]))
#the value, i.e. height in the graph = scaled % of migration 
value <- 100 * us$value / max(us$value)
col <- rainbow(10,start=2.8/6,end=3.4/6)
col <- col[floor(length(col)*(100-value)/100) + 1]
#rendering the globe
globejs(lat=test$latitude, long=test$longitude, value=value, color=col,
        atmosphere=TRUE)
