# R的速度較Python快上許多
library(geosphere)
library(tidyr)
library(dplyr)

# house
house <- read.csv("../toTGOS/part1_min.csv", header= T, sep=",",stringsAsFactors=F, fileEncoding ="UTF-8")
#house <- separate(house, col=V4, into = c("lat", "lon"), sep=",")
#house <- house[,c(1,2,3,5,4)]
house <- house[,4:5]

# incinerator
inci <- read.csv("Incinerator.csv", fileEncoding ="UTF-8")
inci <- separate(inci, col=Lan..Long, into = c("lat", "lon"), sep = ",") # split Lat Lon
inci <- inci[,c(1,3,2)] # change order to lon, lat
inci <- inci[,-1]

# hospital
hos <- read.csv("Hospital.csv", fileEncoding ="UTF-8")
hos <- separate(hos, col=LanLong, into = c("lat", "lon"), sep = ",") # split Lat Lon
hos <- hos[,c(1,3,2)] # change order to lon, lat
hos <- hos[,-1]

# MRT
mrt <- read.csv("MRT.csv", fileEncoding ="UTF-8")
mrt <- separate(mrt, col=Lan..Long, into = c("lat", "lon"), sep = ",") # split Lat Lon
mrt <- mrt[,c(1,3,2)] # change order to lon, lat
mrt <- mrt[,-1]

# mart
mart <- read.csv("Mart.csv", fileEncoding ="UTF-8")
mart <- separate(mart, col=Lan..Long, into = c("lat", "lon"), sep = ",") # split Lat Lon
mart <- mart[,c(1,3,2)] # change order to lon, lat
mart <- mart[,-1]

# gas
gas <- read.csv("GasStation.csv", fileEncoding ="UTF-8")
gas <- separate(gas, col=Lan..Long, into = c("lat", "lon"), sep = ",") # split Lat Lon
gas <- gas[,c(1,3,2)] # change order to lon, lat
gas <- gas[,-1]

#school
school <- read.csv("School.csv", header=F,sep=",",stringsAsFactors=F,fileEncoding ="UTF-8")
school <- school[-1,]
school <- school[,-1]

#park
park <- read.csv("park_final.csv", sep=",",stringsAsFactors=F, fileEncoding ="utf-8", header = F)
park <- separate(park, col=V2, into = c("lat", "lon"), sep = ",") # split Lat Lon
park <- park[,c(1,3,2)] # change order to lon, lat
park <- park[,-1]

# min_inci
system.time(tmp_inci <- apply(house, 1, function(x) {
                                dm <- distm(x, inci, fun=distGeo)
                                min <- min(dm)
                                return(min/1000)
                              })) # apply回傳成一個vector

?distGeo
# min_hos
system.time(tmp_hos <- apply(house, 1, function(x) {
                                dm <- distm(x, hos, fun=distGeo)
                                min <- min(dm)
                                return(min/1000)
                              }))

# min_mrt
system.time(tmp_mrt <- apply(house, 1, function(x) {
                                dm <- distm(x, mrt, fun=distGeo)
                                min <- min(dm)
                                return(min/1000)
                              }))

# min_mart
system.time(tmp_mart <- apply(house, 1, function(x) {
                                dm <- distm(x, mart, fun=distGeo)
                                min <- min(dm)
                                return(min/1000)
                              }))

# min_gas
system.time(tmp_gas <- apply(house, 1, function(x) {
                                dm <- distm(x, gas, fun=distGeo)
                                min <- min(dm)
                                return(min/1000)
                              }))

# min_school
system.time(tmp_school <- apply(house, 1, function(x) {
                                dm <- distm(x, school, fun=distGeo)
                                min <- min(dm)
                                return(min/1000)
                              }))

# min_park
system.time(tmp_park <- apply(house, 1, function(x) {
                                dm <- distm(x, park, fun=distGeo)
                                min <- min(dm)
                                return(min/1000)
                              }))

# turn vector in dataframe in order to bind the columns
min_inci <- data.frame(tmp_inci)
min_hos <- data.frame(tmp_hos)
min_mrt <- data.frame(tmp_mrt)
min_mart <- data.frame(tmp_mart)
min_gas <- data.frame(tmp_gas)
min_school <- data.frame(tmp_school)
min_park <- data.frame(tmp_park)
is.list(tmp_inci)
min_all <- bind_cols(list(min_inci,min_hos,min_mrt,min_mart,min_gas,min_school,min_park))

min_partX <- cbind(house,min_all)
View(min_partX)
write.csv(min_partX, "min_partX.csv")







## distm example
?distGeo
# NOT RUN {
xy <- rbind(c(0,0),c(90,90),c(10,10),c(-120,-45))
distm(xy)
xy2 <- rbind(c(0,0),c(10,-10))
distm(xy, xy2)
# }

