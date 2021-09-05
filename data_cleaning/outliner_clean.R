library(tidyverse)
library(outliers)
#資料前處理####
tmp <- read.csv("data/data/table/table_for_model(date+floor).csv",fileEncoding="utf-8")
class(tmp$yearMonth)


tmp1 <- separate(tmp,yearMonth,c("year","month"),"-")
tmp1$year <- as.numeric(tmp1$year)
#篩選年份####
tmp1.tb <- as_tibble(tmp1)
tmp1.tb_fit <- filter(tmp1.tb, year==100 | year==101 | year==102 | year==103 | year==104 | year==105 |
                       year==106 | year==107 | year==108 | year==109 | year==110)
#依年份去除極端值####
boxplot( unit_price_ping ~ year , data=tmp1.tb_fit, # X軸的值   # Y軸的值
          main="X",   # 圖片名稱
          xlab="年",            # X軸名稱
          ylab="price")

tmp1.tb_fit %>%
    group_by(year) %>%
        summarise(
         number = n(),
         avg_price = mean(unit_price_ping),
         sd_price = sd(unit_price_ping),
         max_price = max(unit_price_ping),
         min_price = min(unit_price_ping),
         IQR_price = IQR(unit_price_ping)
      )
#
a<-tmp1.tb_fit %>%
    group_by(year) %>%
      summarise(
        IQR_price = IQR(unit_price_ping),
        Q1=quantile(unit_price_ping, probs = 0.25),
        Q3=quantile(unit_price_ping, probs = 0.75),
        lower=quantile(unit_price_ping, probs = 0.25)-1.5*IQR(unit_price_ping),
        upper=quantile(unit_price_ping, probs = 0.75)+1.5*IQR(unit_price_ping)
        )

tmp1.tb_without_outlier = as.data.frame(matrix(nrow = 0,ncol = 26))

for (i in 1:14){
  b<-tmp1.tb_fit %>%
    filter(year == a$year[i]) %>%
      filter(unit_price_ping > a$lower[i] & unit_price_ping < a$upper[i])
  tmp1.tb_without_outlier <- rbind(tmp1.tb_without_outlier,b)
  }

tmp1.tb_outlier <- tmp1.tb %>% setdiff(tmp1.tb_without_outlier)

#先依年份再依行政區分類後再取極端值
#100####
tmp1.tb_100 <- filter(tmp1.tb, year==100)  
a<-tmp1.tb_100 %>%
  group_by(section) %>%
  summarise(
    IQR_price = IQR(unit_price_ping),
    Q1=quantile(unit_price_ping, probs = 0.25),
    Q3=quantile(unit_price_ping, probs = 0.75),
    lower=quantile(unit_price_ping, probs = 0.25)-1.5*IQR(unit_price_ping),
    upper=quantile(unit_price_ping, probs = 0.75)+1.5*IQR(unit_price_ping)
  )
###
tmp1.tb_without_outlier_100 = as.data.frame(matrix(nrow = 0,ncol = 26))
###
for (i in 1:nrow(a)){
  b<-tmp1.tb_100 %>%
    filter(section == a$section[i]) %>%
    filter(unit_price_ping > a$lower[i] & unit_price_ping < a$upper[i])
    tmp1.tb_without_outlier_100 <- rbind(tmp1.tb_without_outlier_100,b)
}
###
tmp1.tb_outlier_100 <- tmp1.tb_100 %>% setdiff(tmp1.tb_without_outlier_100)
#101####
tmp1.tb_101 <- filter(tmp1.tb, year==101)  
a<-tmp1.tb_101 %>%
  group_by(section) %>%
  summarise(
    IQR_price = IQR(unit_price_ping),
    Q1=quantile(unit_price_ping, probs = 0.25),
    Q3=quantile(unit_price_ping, probs = 0.75),
    lower=quantile(unit_price_ping, probs = 0.25)-1.5*IQR(unit_price_ping),
    upper=quantile(unit_price_ping, probs = 0.75)+1.5*IQR(unit_price_ping)
  )
###
tmp1.tb_without_outlier_101 = as.data.frame(matrix(nrow = 0,ncol = 26))
###
for (i in 1:nrow(a)){
  b<-tmp1.tb_101 %>%
    filter(section == a$section[i]) %>%
    filter(unit_price_ping > a$lower[i] & unit_price_ping < a$upper[i])
    tmp1.tb_without_outlier_101 <- rbind(tmp1.tb_without_outlier_101,b)
}
###
tmp1.tb_outlier_101 <- tmp1.tb_101 %>% setdiff(tmp1.tb_without_outlier_101)
#102####
tmp1.tb_102 <- filter(tmp1.tb, year==102)  
a<-tmp1.tb_102 %>%
  group_by(section) %>%
  summarise(
    IQR_price = IQR(unit_price_ping),
    Q1=quantile(unit_price_ping, probs = 0.25),
    Q3=quantile(unit_price_ping, probs = 0.75),
    lower=quantile(unit_price_ping, probs = 0.25)-1.5*IQR(unit_price_ping),
    upper=quantile(unit_price_ping, probs = 0.75)+1.5*IQR(unit_price_ping)
  )
###
tmp1.tb_without_outlier_102 = as.data.frame(matrix(nrow = 0,ncol = 26))
###
for (i in 1:nrow(a)){
  b<-tmp1.tb_102 %>%
    filter(section == a$section[i]) %>%
    filter(unit_price_ping > a$lower[i] & unit_price_ping < a$upper[i])
  tmp1.tb_without_outlier_102 <- rbind(tmp1.tb_without_outlier_102,b)
}
###
tmp1.tb_outlier_102 <- tmp1.tb_102 %>% setdiff(tmp1.tb_without_outlier_102)
#103####
tmp1.tb_103 <- filter(tmp1.tb, year==103)  
a<-tmp1.tb_103 %>%
  group_by(section) %>%
  summarise(
    IQR_price = IQR(unit_price_ping),
    Q1=quantile(unit_price_ping, probs = 0.25),
    Q3=quantile(unit_price_ping, probs = 0.75),
    lower=quantile(unit_price_ping, probs = 0.25)-1.5*IQR(unit_price_ping),
    upper=quantile(unit_price_ping, probs = 0.75)+1.5*IQR(unit_price_ping)
  )
###
tmp1.tb_without_outlier_103 = as.data.frame(matrix(nrow = 0,ncol = 26))
###
for (i in 1:nrow(a)){
  b<-tmp1.tb_103 %>%
    filter(section == a$section[i]) %>%
    filter(unit_price_ping > a$lower[i] & unit_price_ping < a$upper[i])
  tmp1.tb_without_outlier_103 <- rbind(tmp1.tb_without_outlier_103,b)
}
###
tmp1.tb_outlier_103 <- tmp1.tb_103 %>% setdiff(tmp1.tb_without_outlier_103)
#104####
tmp1.tb_104 <- filter(tmp1.tb, year==104)  
a<-tmp1.tb_104 %>%
  group_by(section) %>%
  summarise(
    IQR_price = IQR(unit_price_ping),
    Q1=quantile(unit_price_ping, probs = 0.25),
    Q3=quantile(unit_price_ping, probs = 0.75),
    lower=quantile(unit_price_ping, probs = 0.25)-1.5*IQR(unit_price_ping),
    upper=quantile(unit_price_ping, probs = 0.75)+1.5*IQR(unit_price_ping)
  )
###
tmp1.tb_without_outlier_104 = as.data.frame(matrix(nrow = 0,ncol = 26))
###
for (i in 1:nrow(a)){
  b<-tmp1.tb_104 %>%
    filter(section == a$section[i]) %>%
    filter(unit_price_ping > a$lower[i] & unit_price_ping < a$upper[i])
  tmp1.tb_without_outlier_104 <- rbind(tmp1.tb_without_outlier_104,b)
}
###
tmp1.tb_outlier_104 <- tmp1.tb_104 %>% setdiff(tmp1.tb_without_outlier_104)
#105####
tmp1.tb_105 <- filter(tmp1.tb, year==105)  
a<-tmp1.tb_105 %>%
  group_by(section) %>%
  summarise(
    IQR_price = IQR(unit_price_ping),
    Q1=quantile(unit_price_ping, probs = 0.25),
    Q3=quantile(unit_price_ping, probs = 0.75),
    lower=quantile(unit_price_ping, probs = 0.25)-1.5*IQR(unit_price_ping),
    upper=quantile(unit_price_ping, probs = 0.75)+1.5*IQR(unit_price_ping)
  )
###
tmp1.tb_without_outlier_105 = as.data.frame(matrix(nrow = 0,ncol = 26))
###
for (i in 1:nrow(a)){
  b<-tmp1.tb_105 %>%
    filter(section == a$section[i]) %>%
    filter(unit_price_ping > a$lower[i] & unit_price_ping < a$upper[i])
  tmp1.tb_without_outlier_105 <- rbind(tmp1.tb_without_outlier_105,b)
}
###
tmp1.tb_outlier_105 <- tmp1.tb_105 %>% setdiff(tmp1.tb_without_outlier_105)
#106####
tmp1.tb_106 <- filter(tmp1.tb, year==106)  
a<-tmp1.tb_106 %>%
  group_by(section) %>%
  summarise(
    IQR_price = IQR(unit_price_ping),
    Q1=quantile(unit_price_ping, probs = 0.25),
    Q3=quantile(unit_price_ping, probs = 0.75),
    lower=quantile(unit_price_ping, probs = 0.25)-1.5*IQR(unit_price_ping),
    upper=quantile(unit_price_ping, probs = 0.75)+1.5*IQR(unit_price_ping)
  )
###
tmp1.tb_without_outlier_106 = as.data.frame(matrix(nrow = 0,ncol = 26))
###
for (i in 1:nrow(a)){
  b<-tmp1.tb_106 %>%
    filter(section == a$section[i]) %>%
    filter(unit_price_ping > a$lower[i] & unit_price_ping < a$upper[i])
  tmp1.tb_without_outlier_106 <- rbind(tmp1.tb_without_outlier_106,b)
}
###
tmp1.tb_outlier_106 <- tmp1.tb_106 %>% setdiff(tmp1.tb_without_outlier_106)
#107####
tmp1.tb_107 <- filter(tmp1.tb, year==107)  
a<-tmp1.tb_107 %>%
  group_by(section) %>%
  summarise(
    IQR_price = IQR(unit_price_ping),
    Q1=quantile(unit_price_ping, probs = 0.25),
    Q3=quantile(unit_price_ping, probs = 0.75),
    lower=quantile(unit_price_ping, probs = 0.25)-1.5*IQR(unit_price_ping),
    upper=quantile(unit_price_ping, probs = 0.75)+1.5*IQR(unit_price_ping)
  )
###
tmp1.tb_without_outlier_107 = as.data.frame(matrix(nrow = 0,ncol = 26))
###
for (i in 1:nrow(a)){
  b<-tmp1.tb_107 %>%
    filter(section == a$section[i]) %>%
    filter(unit_price_ping > a$lower[i] & unit_price_ping < a$upper[i])
  tmp1.tb_without_outlier_107 <- rbind(tmp1.tb_without_outlier_107,b)
}
###
tmp1.tb_outlier_107 <- tmp1.tb_107 %>% setdiff(tmp1.tb_without_outlier_107)
#108####
tmp1.tb_108 <- filter(tmp1.tb, year==108)  
a<-tmp1.tb_108 %>%
  group_by(section) %>%
  summarise(
    IQR_price = IQR(unit_price_ping),
    Q1=quantile(unit_price_ping, probs = 0.25),
    Q3=quantile(unit_price_ping, probs = 0.75),
    lower=quantile(unit_price_ping, probs = 0.25)-1.5*IQR(unit_price_ping),
    upper=quantile(unit_price_ping, probs = 0.75)+1.5*IQR(unit_price_ping)
  )
###
tmp1.tb_without_outlier_108 = as.data.frame(matrix(nrow = 0,ncol = 26))
###
for (i in 1:nrow(a)){
  b<-tmp1.tb_108 %>%
    filter(section == a$section[i]) %>%
    filter(unit_price_ping > a$lower[i] & unit_price_ping < a$upper[i])
  tmp1.tb_without_outlier_108 <- rbind(tmp1.tb_without_outlier_108,b)
}
###
tmp1.tb_outlier_108 <- tmp1.tb_108 %>% setdiff(tmp1.tb_without_outlier_108)
#109####
tmp1.tb_109 <- filter(tmp1.tb, year==109)  
a<-tmp1.tb_109 %>%
  group_by(section) %>%
  summarise(
    IQR_price = IQR(unit_price_ping),
    Q1=quantile(unit_price_ping, probs = 0.25),
    Q3=quantile(unit_price_ping, probs = 0.75),
    lower=quantile(unit_price_ping, probs = 0.25)-1.5*IQR(unit_price_ping),
    upper=quantile(unit_price_ping, probs = 0.75)+1.5*IQR(unit_price_ping)
  )
###
tmp1.tb_without_outlier_109 = as.data.frame(matrix(nrow = 0,ncol = 26))
###
for (i in 1:nrow(a)){
  b<-tmp1.tb_109 %>%
    filter(section == a$section[i]) %>%
    filter(unit_price_ping > a$lower[i] & unit_price_ping < a$upper[i])
  tmp1.tb_without_outlier_109 <- rbind(tmp1.tb_without_outlier_109,b)
}
###
tmp1.tb_outlier_109 <- tmp1.tb_109 %>% setdiff(tmp1.tb_without_outlier_109)
#110####
tmp1.tb_110 <- filter(tmp1.tb, year==110)  
a<-tmp1.tb_110 %>%
  group_by(section) %>%
  summarise(
    IQR_price = IQR(unit_price_ping),
    Q1=quantile(unit_price_ping, probs = 0.25),
    Q3=quantile(unit_price_ping, probs = 0.75),
    lower=quantile(unit_price_ping, probs = 0.25)-1.5*IQR(unit_price_ping),
    upper=quantile(unit_price_ping, probs = 0.75)+1.5*IQR(unit_price_ping)
  )
###
tmp1.tb_without_outlier_110 = as.data.frame(matrix(nrow = 0,ncol = 26))
###
for (i in 1:nrow(a)){
  b<-tmp1.tb_110 %>%
    filter(section == a$section[i]) %>%
    filter(unit_price_ping > a$lower[i] & unit_price_ping < a$upper[i])
  tmp1.tb_without_outlier_110 <- rbind(tmp1.tb_without_outlier_110,b)
}
###
tmp1.tb_outlier_110 <- tmp1.tb_110 %>% setdiff(tmp1.tb_without_outlier_110)