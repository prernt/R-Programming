flights.info<-nycflights13::flights
View(head(flights.info,10))
flights.info.update<-select(flights.info,year:day,hour,origin,dest,tailnum,carrier)
head(flights.info.update,10)
airlines.info<-nycflights13::airlines
airlines.info<-airlines.info[-1,]
View(airlines.info)
left_join(flights.info.update,airlines.info,by = "carrier")
right_join(airlines.info,flights.info.update,by = "carrier")




data("women")
women.data<-women
summary(women.data)


ggplot(data = women,mapping = aes(x=weight,y=height))+geom_point()
pdf("plot.pdf")
ggplot(data = women, mapping = aes(x=weight, y=height)) + geom_point()
dev.off()
jpeg("dotplot.jpeg")
ggplot(data = women, mapping = aes(x=weight, y=height)) + geom_point()
dev.off()
cor.test(women$height,women$weight)
summary(womenModel)
model<-lm(height~weight,data = women)
summary(model)
jpeg("dotplot.jpeg")
ggplot(data = women,mapping = aes(x=weight,y=height))+geom_point()+geom_abline(mapping = aes(slope =model$coefficients[2],intercept= model$coefficients[1]),color='red')
dev.off()
plot(model,which=1)
plot(model,which=2)
plot(model,which=3)
plot(model,which=4)
plot(model,which=5)
plot(model,which=6)
plot(model,which=7)
ndf<-data.frame(weight=c(158,164))
predict_weight<-predict(model,newdata = ndf)
predict_weight


#faithful dataset
data.faith<-faithful
data.faith
cor(data.faith$eruptions,data.faith$waiting)
faith.model<-lm(eruptions~waiting, data = data.faith)
summary(faith.model)
new.data.faith <- data.frame(waiting = 80)
predict(faith.model,newdata = new.data.faith)
shapiro.test(women$weight)
shapiro.test(women$height)


#multiple lr
data("mtcars")
?mtcars
View(mtcars)
cars.model<-lm(mpg~cyl+disp+hp+drat+wt+qsec+vs+am+gear+carb, data = mtcars)
summary(cars.model)
new.data.cars<-data.frame(cyl=6,disp=160,hp=110,drat=3.9,wt=2.62,qsec=16.46,vs=0,am=1,gear=4,carb=4)
predict<-predict(cars.model,newdata = new.data.cars)
predict.df<-data.frame(mpg = mtcars$mpg, predict = cars.model$fitted.values)
predict.df
pdf("cars1.pdf")
ggplot(data = predict.df,mapping = aes(x=mpg,y=predict))+geom_point()+geom_abline(mapping = aes(slope=1, intercept=0),color = "blue")
dev.off()
cor(mtcars)
reducedModel <-step(cars.model,direction = "backward")
summary(reducedModel)
