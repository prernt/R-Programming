install.packages("ggplot2")
library(ggplot2)
data("mpg")
dset<-mpg
dset
data.audi<-filter(dset,manufacturer =="audi")
head(data.audi)
#Filter rows where the manufacturer is Audi or the year of production (year) is 1999
dfilter<-filter(dset,manufacturer=="audi" & year== "1999")
dfilter
dfilter1<-filter(dset,manufacturer != "audi" & year== "1999")
dfilter1
filter(dset,(manufacturer=="audi"|manufacturer=="chevrolet") & year=="1999")
dfilter2<-filter(dset,manufacturer %in% c("audi","volkswagen") & year=="1999" & displ>2)
dfilter2%>% count(manufacturer)
dfilter3<-filter(dset,year=="1999" & displ>2)
dfilter3
dfilter3%>% count(manufacturer,sort=TRUE)
sf<- sample_frac(mpg,0.5, replace = TRUE)
sf
sn<-sample_n(mpg,10,replace = TRUE,set.seed(2))
sn

beijing_data<-beijing_data[-1,]
arrange(beijing_data,Country)
arrange(beijing_data,desc(Gold),desc(Silver),desc(Bronze))
beijing_data
view(beijing_data)
select(mpg,manufacturer,year,hwy)%>%arrange(desc(year))
select(mpg,starts_with("d"))
beijing_data["total"]<-rowSums(beijing_data[c("Gold","Silver")])
beijing_data
beijing_data<-mutate(beijing_data,total=Gold+Silver+Bronze)
beijing_data
mpg_summary <- summarise(mpg, avg_cty = mean(cty), avg_hwy = mean(hwy))
mpg_summary
mpg_summary2 <- group_by(mpg,manufacturer,year) %>% summarise(count = n())
View(mpg_summary2)
unique.models<- group_by(mpg,manufacturer)%>%summarise(count= n_distinct(model),)
unique.models
mpg.edit<- mutate(mpg,HwyCtyRatio = hwy/cty)
view(mpg.edit)

