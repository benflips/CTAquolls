wd<-getwd()
setwd("data")

#Female survival year 1
d2<-read.table("female survival yr1.txt", header=T, sep="\t")
fsurv1<-d2$surv/d2$n
fsurv1<-c(fsurv1, 0.2488178) # from NAomi's CJS

#Female survival year 2
d3<-read.table("female survival yr2.txt", header=T, sep="\t")
fsurv2<-d3$surv/d3$n


#Male survival
d1<-read.table("Male survival.txt", header=T, sep="\t")
msurv<-d1$surv/d1$n
msurv<-c(msurv, 0.0621345) # from NAomi's CJS

pars<-c(mean(fsurv1), mean(fsurv2),mean(msurv))
names(pars)<-c("fsurv1", "fsurv2", "msurv")

setwd(wd)

rm(d1, d2, d3, fsurv1, fsurv2, msurv, wd)