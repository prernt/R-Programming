# Data Frames
medals <-data.frame(Country =c( "NOR" , "GER" , "CHN" ) ,
                        Gold =c(16 ,12 ,9) ,
                        Silver =c(8 ,10 ,4) ,
                        Bronze =c(13 ,5 ,2))
medals
fm<- medals[medals$Country %in% c("NOR","GER"),]
fm
medals[medals$Country == "NOR",]
medals[c(1,3),c(1,3)]
medals[stringr::str_detect(medals$Country,"CHN"),]
medals[medals$Country %in% c("NOR","GER"),]
subset(medals, Gold>=10,select = c("Country","Gold"))
medals[order(medals$Bronze,decreasing = FALSE),]


beijing_data<- read.csv(file = "Beijing2022.csv",sep = ";",header = FALSE, col.names = c("Country","Gold","Silver","Bronze"))
beijing_data<- beijing_data[-1,]
beijing_data
beijing_data$TotalMedals<- beijing_data$Gold+beijing_data$Silver+beijing_data$Bronze
beijing_data
beijing_data<- beijing_data[order(beijing_data$TotalMedals, decreasing = TRUE),]
beijing_data<- beijing_data[order(beijing_data$Gold, decreasing = TRUE),]
beijing_data
total.gold<- sum(beijing_data$Gold)
total.gold
total.silver<- sum(beijing_data$Silver)
total.silver
total.bronze<- sum(beijing_data$Bronze)
total.bronze
total.all.medals <-sum(beijing_data$TotalMedals)
total.all.medals


#Data Exploration
data("women")
women
summary(women)
mean(women$height)
par(mfrow = c(2,2))
hist(women$height,breaks = 3,xlab = "height",main="Graph")
hist(women$weight,breaks = 3,xlab = "weight")
hist(women$height,breaks = 6,xlab = "height")
hist(women$weight,breaks = 6,xlab = "weight")
dev.off()
plot(x= women$weight,y=women$height,type = "l",lty = "dashed")
