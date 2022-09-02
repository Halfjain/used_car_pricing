#Check and set working directory
setwd("C:/Users/bsf0006/Documents/BUAL 5860")
getwd()

#Required packages
library(xlsx)



md<-read.csv("main.semiclean.csv")
alw<-read.csv("auction.location.weather.csv")

md <- merge(md, alw, by="auction_code")
md <- md[!(md$transmission==""),]

#DROPPING VALUES
md <- md[!(md$body=="NONE"),]
md <- md[!(md$body==""),]
md <- md[!(md$body=="M/C"),]
md <- md[!(md$body=="BBOW"),]
md <- md[!(md$body=="OTH"),]
md <- md[!(md$body=="HTRK"),]
md <- md[!(md$body=="CGEN"),]
md <- md[!(md$body=="2MPV"),]
md <- md[!(md$body=="HBOX"),]
md <- md[!(md$body=="OTHE"),]
md <- md[!(md$body=="PDUN"),]
md <- md[!(md$body=="MC"),]
md <- md[!(md$body=="TRLR"),]
md <- md[!(md$body=="BSKI"),]
md <- md[!(md$body=="BTRK"),]
md <- md[!(md$body=="CONS"),]
md <- md[!(md$body=="PART"),]
md <- md[!(md$body=="PDRI"),]
md <- md[!(md$body=="PS"),]
md <- md[!(md$body=="RVB"),]
md <- md[!(md$body=="2DRN"),]
md <- md[!(md$body=="3MPV"),]
md <- md[!(md$body=="4SWD"),]
md <- md[!(md$body=="5DSW"),]
md <- md[!(md$body=="6AN"),]
md <- md[!(md$body=="BCTR"),]
md <- md[!(md$body=="BPER"),]
md <- md[!(md$body=="BSAI"),]
md <- md[!(md$body=="CNVT"),]
md <- md[!(md$body=="CPAC"),]
md <- md[!(md$body=="CWLD"),]
md <- md[!(md$body=="HBUS"),]
md <- md[!(md$body=="MEGA"),]
md <- md[!(md$body=="MOTC"),]
md <- md[!(md$body=="PAPV"),]
md <- md[!(md$body=="PUTV"),]
md <- md[!(md$body=="RV"),]
md <- md[!(md$body=="RVC"),]
md <- md[!(md$body=="RVPU"),]
md <- md[!(md$body=="SL"),]
md <- md[!(md$body=="UTV"),]

#Create a Variable for Age
md$age <- (2020 - md$car_year)

#Dummy Variable for Vehicle Type
md$suv<-0
md$suv[md$body=="SUV"]<-1
md$suv[md$body=="4SUV"]<-1
md$suv[md$body=="2SUV"]<-1
md$suv[md$body=="4SUT"]<-1
md$suv[md$body=="4APV"]<-1
md$suv[md$body=="2SUT"]<-1
md$suv[md$body=="5MPV"]<-1
md$suv[md$body=="ATV"]<-1
md$suv[md$body=="RVSU"]<-1
md$suv[md$body=="4MPV"]<-1


md$cuv<-0
md$cuv[md$body=="4WGN"]<-1
md$cuv[md$body=="4DHB"]<-1
md$cuv[md$body=="5WGN"]<-1
md$cuv[md$body=="SW4D"]<-1
md$cuv[md$body=="WAGO"]<-1
md$cuv[md$body=="WGN"]<-1
md$cuv[md$body=="MPV"]<-1
md$cuv[md$body=="2CUV"]<-1
md$cuv[md$body=="3WGN"]<-1
md$cuv[md$body=="2CV"]<-1
md$cuv[md$body=="SW5D"]<-1

md$sdn<-0
md$sdn[md$body=="4DSN"]<-1
md$sdn[md$body=="SEDA"]<-1
md$sdn[md$body=="4DR"]<-1
md$sdn[md$body=="4SDN"]<-1
md$sdn[md$body=="LIMO"]<-1
md$sdn[md$body=="SDN"]<-1
md$sdn[md$body=="5DSN"]<-1
md$sdn[md$body=="4DLB"]<-1
md$sdn[md$body=="5DLB"]<-1
md$sdn[md$body=="4DSD"]<-1
md$sdn[md$body=="4DNS"]<-1
md$sdn[md$body=="4DS"]<-1
md$sdn[md$body=="4SND"]<-1

md$trk<-0
md$trk[md$body=="CREW"]<-1
md$trk[md$body=="XCAB"]<-1
md$trk[md$body=="DCAB"]<-1
md$trk[md$body=="RCAB"]<-1
md$trk[md$body=="TRUC"]<-1
md$trk[md$body=="MBOX"]<-1
md$trk[md$body=="PATV"]<-1
md$trk[md$body=="QUAD"]<-1
md$trk[md$body=="2PUT"]<-1
md$trk[md$body=="4PUT"]<-1
md$trk[md$body=="PUT"]<-1
md$trk[md$body=="XC4D"]<-1
md$trk[md$body=="XC2D"]<-1
md$trk[md$body=="TRK"]<-1

md$hbk<-0
md$hbk[md$body=="5DHB"]<-1
md$hbk[md$body=="2DHB"]<-1
md$hbk[md$body=="HATC"]<-1
md$hbk[md$body=="2DLB"]<-1
md$hbk[md$body=="3DHB"]<-1
md$hbk[md$body=="3DR"]<-1

md$cvt<-0
md$cvt[md$body=="2DCV"]<-1
md$cvt[md$body=="CONV"]<-1
md$cvt[md$body=="4DHT"]<-1
md$cvt[md$body=="2DHT"]<-1
md$cvt[md$body=="2DR"]<-1
md$cvt[md$body=="2DST"]<-1
md$cvt[md$body=="2DRC"]<-1

md$coop<-0
md$coop[md$body=="2DCP"]<-1
md$coop[md$body=="COUP"]<-1
md$coop[md$body=="3DCP"]<-1
md$coop[md$body=="4DCP"]<-1
md$coop[md$body=="2DSN"]<-1
md$coop[md$body=="2CPE"]<-1
md$coop[md$body=="2 DR"]<-1
md$coop[md$body=="2CP"]<-1
md$coop[md$body=="2DSD"]<-1
md$coop[md$body=="3DTT"]<-1

md$van<-0
md$van[md$body=="VAN"]<-1
md$van[md$body=="4VAN"]<-1
md$van[md$body=="CARG"]<-1
md$van[md$body=="3VAN"]<-1


#Dummy Variable for Vehicle Make
md$acura<-0
md$acura[md$make=="ACURA"]<-1
md$audi<-0
md$audi[md$make=="AUDI"]<-1
md$bmw<-0
md$bmw[md$make=="BMW"]<-1
md$honda<-0
md$honda[md$make=="HONDA"]<-1
md$hyundai<-0
md$hyundai[md$make=="HYUNDAI"]<-1
md$kia<-0
md$kia[md$make=="KIA"]<-1
md$lr<-0
md$lr[md$make=="LANDROVER"]<-1
md$lexus<-0
md$lexus[md$make=="LEXUS"]<-1
md$lincoln<-0
md$lincoln[md$make=="LINCOLN"]<-1
md$maserati<-0
md$maserati[md$make=="MASERATI"]<-1
md$mercedes<-0
md$mercedes[md$make=="MERCEDES"]<-1
md$porsche<-0
md$porsche[md$make=="PORSCHE"]<-1
md$toyota<-0
md$toyota[md$make=="TOYOTA"]<-1
md$vw<-0
md$vw[md$make=="VOLKSWAGEN"]<-1

#Dummy Variable for Auction Region
md$canada<-0
md$canada[md$region=="Canada"]<-1
md$cr<-0
md$cr[md$region=="Central Region"]<-1
md$er<-0
md$er[md$region=="East Region"]<-1
md$fr<-0
md$fr[md$region=="Florida Region"]<-1
md$mr<-0
md$mr[md$region=="Midwest Region"]<-1
md$nr<-0
md$nr[md$region=="Northeast Region"]<-1
md$wr<-0
md$wr[md$region=="West Region"]<-1

#Dummy variables for transmission type
md$M<-0
md$M[md$transmission=="M"]<-1
md$P<-0
md$P[md$transmission=="P"]<-1
md$A<-0
md$A[md$transmission=="A"]<-1
md$A[md$transmission=="O"]<-1


#Format date to create seasonal dummy variables
sold.month<-as.Date(md$sold_date, format="%Y-%m-%d")
md$sold.month<-format(sold.month, format="%m")
md$sold.month.day<-format(sold.month, format="%m-%d")

#Dummy variable for season the vehicle was sold
md$winter<-0
md$spring<-0
md$summer<-0
md$fall<-0
md$winter[md$sold.month=="01"]<-1
md$winter[md$sold.month=="02"]<-1
md$spring[md$sold.month=="03"]<-1
md$spring[md$sold.month=="04"]<-1
md$spring[md$sold.month=="05"]<-1
md$summer[md$sold.month=="06"]<-1
md$summer[md$sold.month=="07"]<-1
md$summer[md$sold.month=="08"]<-1
md$fall[md$sold.month=="09"]<-1
md$fall[md$sold.month=="10"]<-1
md$fall[md$sold.month=="11"]<-1
md$winter[md$sold.month=="12"]<-1

write.csv(md, file = "mauto.dummies.csv")

