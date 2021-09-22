library(tidyverse)
library(outliers)

tmp <- read.csv("table_for_model(date+floor)_0906.csv",fileEncoding="utf-8")
tmp1 <- separate(tmp,yearMonth,c("year","month"),"-")
tmp1$year <- as.numeric(tmp1$year)
unique(tmp1$section)

outlier_cleaner<-function(tb){
  #100
  tmp1.tb_100 <- filter(tb, year==100)  
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
  #101
  tmp1.tb_101 <- filter(tb, year==101)  
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
  #102
  tmp1.tb_102 <- filter(tb, year==102)  
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
  #103
  tmp1.tb_103 <- filter(tb, year==103)  
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
  #104
  tmp1.tb_104 <- filter(tb, year==104)  
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
  #105
  tmp1.tb_105 <- filter(tb, year==105)  
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
  #106
  tmp1.tb_106 <- filter(tb, year==106)  
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
  #107
  tmp1.tb_107 <- filter(tb, year==107)  
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
  #108
  tmp1.tb_108 <- filter(tb, year==108)  
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
  #109
  tmp1.tb_109 <- filter(tb, year==109)  
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
  #110
  tmp1.tb_110 <- filter(tb, year==110)  
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
  #output
  tb_without_outliner <- rbind(tmp1.tb_without_outlier_100,
                               tmp1.tb_without_outlier_101,
                               tmp1.tb_without_outlier_102,
                               tmp1.tb_without_outlier_103,
                               tmp1.tb_without_outlier_104,
                               tmp1.tb_without_outlier_105,
                               tmp1.tb_without_outlier_106,
                               tmp1.tb_without_outlier_107,
                               tmp1.tb_without_outlier_108,
                               tmp1.tb_without_outlier_109,
                               tmp1.tb_without_outlier_110)
  return(tb_without_outliner)
}

outlier_cleaner1<-function(tb){
  #建立空DF
  oc <-  as.data.frame(matrix(nrow = 0,ncol = 26))
  #年分
  for (i in 100:110){
    tb_year <- filter(tb,tb$year ==i)
    #該年分有的section
    tb_section <-distinct(tb_year[2])
    #每個Section分離
    for (j in 1:nrow(tb_section)){
        a<-tb_year %>%
          filter(section==tb_section[j,])
        #每個section畫盒鬚圖 
        out <- boxplot( unit_price_ping ~ section , data=a)$out
        #找出跟離群值一樣的資料
        out_ind <- which(a$unit_price_ping %in% c(out))
        #離群值以外的資料
        a_in <- a %>% setdiff(a[out_ind,])
        #rbind資料
        oc <-rbind(oc,a_in)
    }
  }
  return(oc)
}

#debug####
oc <-  as.data.frame(matrix(nrow = 0,ncol = 26))

#年分
tb <- tmp1
i <- 100
  tb_year <- filter(tb,tb$year ==i)
  #該年分有的section
  tb_section <-distinct(tb_year[2])
  #每個Section分離
  for (j in 1:nrow(tb_section)){
    j <- 1
    a <- tb_year %>%
      filter(section==tb_section[j,])
    #每個section畫盒鬚圖 
    out <- boxplot( unit_price_ping ~ section , data=a)$out
    #找出跟離群值一樣的資料
    out_ind <- which(a$unit_price_ping %in% c(out))
    #離群值以外的資料
    a_in <- a %>% setdiff(a[out_ind,])
    #rbind資料
    oc <-rbind(oc,a_in)
  }

#test、繪圖用####
tmp1f1 <- outlier_cleaner1(tmp1)
tmp2f1 <- outlier_cleaner1(tmp1f1)
tmp3f1 <- outlier_cleaner1(tmp2f1)
tmp4f1 <- outlier_cleaner1(tmp3f1)
tmp5f1 <- outlier_cleaner1(tmp4f1)
tmp6f1 <- outlier_cleaner1(tmp5f1)
tmp7f1 <- outlier_cleaner1(tmp6f1)
tmp8f1 <- outlier_cleaner1(tmp7f1)
tmp9f1 <- outlier_cleaner1(tmp8f1)
tmp10f1 <- outlier_cleaner1(tmp9f1)

tmp1f <- outlier_cleaner(tmp1)
tmp2f <- outlier_cleaner(tmp1f)
tmp3f <- outlier_cleaner(tmp2f)
tmp4f <- outlier_cleaner(tmp3f)
tmp5f <- outlier_cleaner(tmp4f)
tmp6f <- outlier_cleaner(tmp5f)
tmp7f <- outlier_cleaner(tmp6f)
tmp8f <- outlier_cleaner(tmp7f)
tmp9f <- outlier_cleaner(tmp8f)
tmp10f <- outlier_cleaner(tmp9f)

data_108 <-tmp10f1 %>% filter(tmp10f1$year == 108)

boxplot( unit_price_ping ~ section , data=data_108, # X軸的值   # Y軸的值
                 main="outliner_cleaner",   # 圖片名稱
                 xlab="section",            # X軸名稱
                 ylab="price")

boxplot( unit_price_ping ~ section , data=tmp10f1, # X軸的值   # Y軸的值
         main="outliner_cleaner",   # 圖片名稱
         xlab="section",            # X軸名稱
         ylab="price")


write.table(tmp10f1,file ="data_for_model(no_outliner,with_100).csv",sep = ",",row.names = FALSE,fileEncoding = "utf-8")

unique(tmp10f1$year)

data_section1 <- tmp10f1 %>%
    filter(section == 1) %>%
    group_by(year) %>%
    summarise(
      mean = mean(unit_price_ping)
     )

plot( mean ~ year , data=data_section1, # X軸的值   # Y軸的值
      main="mean/year",   # 圖片名稱
      xlab="year",            # X軸名稱
      ylab="mean_price",
      type='l'
      )

sum(tmp10f1$section == 1 & tmp10f1$year == 106)
