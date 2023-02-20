#instatiating x
x <- c(1.2, 2.3, 0.2, 1.1)
# printing type of elements in x
class(x)
# printing number of elements in x
length(x)
# printing 2nd element in vector x
x[2]
#printing specific elements like 1 and 3
x[c(1,3)]
#printing range of elements from 2 to 3/4
x[(1:3)]
#replace the value of first element
x[1]<- 10
x
x[1:4]
#selecting values greater than 1 but less than 10
x[x>1 & x<10]
x.squared <- x^2
x.squared
append(x,0.52)
x
length(x)
mean(x)
#combining elements in two vectors
x.combined <- c(x, x.squared)
x.combined
#using negative index in vector strips the value at the index
x.combined[-9]
x.combined
# vector containing the number of days of each month
install.packages("lubridate")
s<- as.Date("2022-01-01")
e<-as.Date("2022-12-01")
month.days <- seq(s,e,by= "month")
month.days
month.days<-lubridate::days_in_month(month.days)
month.days
days_in_year <- sum(month.days)
days_in_year

#Matrices
P <- matrix(data = c(1,2,3,4,5,6,7,8,9),nrow = 3,ncol = 3 ,byrow = TRUE)
P
P[1,2]
P[1,]
P<-P*10
P
sum(P[1,])
sum(P[,1])
#rename row and column names
dimnames(P) = list(c("row1","row2","row3"),c("c1","c2","c3"))
P
class(dimnames(P))
P
P["row2",]
P[,"c2"]
P<-P[,-3]
P
P<-cbind(P,matrix(c(2,1,15),nrow = 3,ncol = 1,byrow = TRUE,dimnames = list(c("r1","r2","r3"),c("column1"))))
P
colnames(P)<- c("c1","c2","c3","c4","c5")
P
country<-c("Aus","Austria","Belarus")
data.olympics <- c(1,2,1,7,7,4,0,2,0) 
Beijing.Olympics.22 <- matrix(data.olympics,nrow = 3,ncol = 3,byrow = TRUE)
rownames(Beijing.Olympics.22)<-country
colnames(Beijing.Olympics.22)<-c("Gold","Silver","Bronze")
Beijing.Olympics.22
cbind(Beijing.Olympics.22,sum(Beijing.Olympics.22[1,]),dimnames=list((country),(c("Gold","Silver","Bronze","Total"))))

#Lists
a <-list("a" , 1 , num = c(4 ,5 ,6))
n.a<-a[c(1,3)]
n.a[2]
n.a$num
names(a)<- c("Third","Second","First")
a[["First"]]
newlist <- a[c("First","Third")]
newlist
