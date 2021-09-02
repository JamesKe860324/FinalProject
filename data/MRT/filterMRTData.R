mydata <- read.csv('D:/JamesKe/Program/期末專題/千禧世代租住房選擇/捷運/northern-taiwan.csv', header = T, fileEncoding = 'UTF-8-BOM')
View(mydata)
a <- mydata[ , c(3,6,7,8,9)]
View(a)
b <- a[ , 3]
View(b)
targetIndex <- grep('桃園市', b)
finalData <- a[-targetIndex, ]
View(finalData)
write.csv(finalData, 'D:/JamesKe/Program/期末專題/千禧世代租住房選擇/捷運/finalMRT.csv', row.names = F)

