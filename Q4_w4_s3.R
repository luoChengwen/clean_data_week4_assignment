url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(url,"lastQ.csv",method="curl")
svey<-read.csv("lastQ.csv")
strsplit(names(svey),"wgtp")[123]

#====================
  
  
url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
download.file(url,"GGDP.csv")
Ggdp<-read.csv("GGDP.csv",skip=4,head=T)
Ggdp2<-select(Ggdp,X,X.1,X.3,X.4)
library(httr)
Ggdp3<-setNames(Ggdp2,c("country_code","rank","country","USD"))
library(stringr)
GP<-gsub(",","",Ggdp3$USD)[1:190]
mean(as.numeric(GP),na.rm=T)
# =====================
  
url1<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
url2<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"

download.file(url1,"GGDP2.csv",method='curl')
download.file(url2,"education2.csv",method="curl")

G<-read.csv("GGDP2.csv",header=T)
E<-read.csv("education2.csv",header=T,skip=5)
G2<-select(G,X,Gross.domestic.product.2012,X.2,X.3)[1:190,]
G3<-setNames(G2,c("ALB","rank","country","USD"))
str(G)
str(E)
L<-merge(E,G3,all=T,by='ALB')
# L$X.1 special notes
M<-L[!is.na(L$X.1),]$X.1
grepl("Fiscal year end: June",M)
 # =================
  
  
  
  
library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn)
library(lubridate)
tr<-ymd(sampleTimes)
tl<- tr[(tr>ymd("2011-12-30")&tr<ymd("2013-01-01"))]
fl<-tl[wday(tl,label=T)=="Mon"]

