library(nycflights13)
View(flights)
flights.edited<-mutate(flights,date = make_date(year,month,day))
View(flights.edited)                       
head(select(flights.edited,year,month,day,date),2)
flights.daily<- filter(flights.edited,dest == "IAH") %>% group_by(date) %>% summarise(count=n())
flights.daily
ggplot(flights.daily,aes(x=flights.daily$date,y=flights.daily$count))+geom_line()+xlab("Date")+ylab("Count")
View(mutate(flights.edited,weekday=wday(date,label=TRUE)))

flights.jan<-filter(flights.edited,month == 1)%>%group_by(day)%>%summarise(count=n())
flights.jan

flights.edited<-mutate(flights.edited, weekdays = wday(date,label=TRUE))%>% mutate(month= month(date,label=TRUE))
View(flights.edited)
flights.visualize<-filter(flights.edited, (dest %in% c("JFK","LGA")| (origin %in% c("JFK","LGA"))))
flights.visualize<- group_by(flights.edited,weekdays,month)%>%summarise(count=n())
View(arrange(flights.visualize,desc(count)))

ggplot(flights.visualize,aes(x=weekdays,y=month,fill=count))+
  scale_fill_gradient(low = "white", high = "red")+geom_tile()+labs(title = "Frequency",x="weekdays",y = "month", fill = "count")


mtcars
mcor<-cor(mtcars)
round(mcor,2)
corrplot(mcor)
cor.test(mtcars,cyl,disp)
