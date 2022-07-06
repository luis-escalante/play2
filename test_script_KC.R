#install.packages("data.table")
library(data.table)
d1<-fread("https://opportunityinsights.org/wp-content/uploads/2018/10/tract_covariates.csv")
View(d1)

KCK_OI<-d1[czname=="Kansas City"]
KCK_OI<-KCK_OI[is.na(hhinc_mean2000==FALSE),]
KCK_OI[hhinc_mean2000<=quantile(hhinc_mean2000,probs = 0.5), bellow_medianIncome:=1]
KCK_OI[is.na(bellow_medianIncome),bellow_medianIncome:=0]

KCK_OI[, med_hhinc_growth1990_2006:=((med_hhinc2016-med_hhinc1990)/med_hhinc1990)*100]
View(KCK_OI)

rm(KCK_OI)
KCK_OI<-d1[czname=="Kansas City"]
View(KCK_OI)
KCK_OI
KCK_OI[,ln_income:=log(hhinc_mean2000)]

KCK_OI[,.(mean_income=mean(hhinc_mean2000),mean_com_time=mean(mean_commutetime2000)),by=czname]
KCK_OI[czname=="Kansas City",which(is.na(hhinc_mean2000))]
KCK_OI[czname=="San Antonio" & is.na(hhinc_mean2000)==T,]
KCK_OI
View
KCK_OI[czname=="San Antonio",][c(374,377),]