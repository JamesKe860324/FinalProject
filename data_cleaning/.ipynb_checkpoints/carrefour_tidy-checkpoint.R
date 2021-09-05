library(tidyverse)
carrefour <- read_csv("Carrefour.csv",)
carrefour[ ,1]
Name <- str_split_fixed (carrefour$店名,"\n",2)[ ,1]
Address <- str_split_fixed (carrefour$地址," ",2)[ ,2]
country <- substr(x = Address,start = 1,stop = 3)
newCarrefour <- tibble(Name=Name,country=country,Address=Address)
newCarrefour1 <- newCarrefour %>% filter(country == "新北市")
newCarrefour1$country <- NULL
write.csv(newCarrefour1, "E:/BDSE_Project/dataset/carrefour_clean.csv",row.names=F)
