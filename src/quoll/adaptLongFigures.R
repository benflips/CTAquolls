## ---------------------------
##
## Script name: adaptLongFigures.R
##
## Purpose of script: Examine long-run simulations and attempt to explain intermediate equilibrium
##
## Author: Ben Phillips
##
## Date Created: 2020-02-26
##
## Copyright (c) Ben Phillips, 2020
## Email: phillipsb@unimelb.edu.au
##
## ---------------------------
##
## Notes:
##   
##
## --------------------------

load(file="out/adaptLongRunK1000.RData")

tss <- 1:200 # time subset to plot

TVec<-seq(0, 1, 0.1)
timeVec<-1:dim(pArr)[1]

meanPhen <- apply(pArr, 1:2, mean, na.rm=TRUE) #mean genetic phenotyp
meanCult <- apply(cArr, 1:2, mean, na.rm=TRUE) #mean cultural phenotyp
sdPhen <- apply(pArr, 1:2, sd, na.rm=TRUE)

##### Figure of genetic adaptation over time #####

pdf(file="out/adaptLong.pdf", width=10, height=7)
par(mar = c(5,5,2,2), mfrow = c(1, 2))

transVec<-c(1:11) # Transmission levels to plot
colourVec<-hcl.colors(length(transVec)) # colours for plotting

#plot 1

plot(meanPhen[tss,1]~timeVec[tss], type="n", 
     ylim=c(0, 1),
     bty="l",
     xlab="Time", 
     ylab="Proportion genetically adapted",
     cex.lab = 1.5)

for (tt in 1:length(transVec)){
  points(meanPhen[tss,transVec[tt]]~timeVec[tss],type="p",pch=20, col= colourVec[tt]) #0  efficacy
  lines(meanPhen[tss,transVec[tt]]~timeVec[tss], lty = 3, col= colourVec[tt])
}

#plot 2

plot(meanCult[tss,1]~timeVec[tss], type="n", 
     ylim=c(0, 1),
     bty="l",
     xlab="Time", 
     ylab="Proportion culturally adapted",
     cex.lab = 1.5)

for (tt in 1:length(transVec)){
  points(meanCult[tss,transVec[tt]]~timeVec[tss],type="p",pch=20, col= colourVec[tt]) #0  efficacy
  lines(meanCult[tss,transVec[tt]]~timeVec[tss], lty = 3, col= colourVec[tt])
}

legend("right",legend=TVec[transVec], 
       col=colourVec, 
       cex = 0.9, 
       pch = 20,
       lty=3,
       #title = "CTA Transmission (T)")
       title=expression(paste("Transmission (", italic("T"), ")")))

dev.off()

##### Heuristic explanation: evolves until selection strength = cultural inefficiency #####
    # pMinus*s = pPlus*(1-T) where pMinus, pPlus refer to proportion culturally stupid, smart respectively.
# pPlusEq <- meanCult[300,]
# pMinusEq <- 1-pPlusEq
# sEq <- 1- meanPhen[300,]
# compT <- 1 - TVec
# 
# pMs <- pMinusEq * sEq
# pPcompT <- pPlusEq * compT
# 
# plot(pMs, pPcompT)


##### Looking at individual reps at T = 0.9 #####
#load(file="out/adaptLongRunK1000.RData")
pdf(file = "out/longRunIndRep.pdf", width = 10, height = 7)
par(mfrow = c(1, 2))



T9 <- pArr[tss, 10, ]
T9c <- cArr[tss, 10, ]

plot(T9[,1]~timeVec[tss], type = "n", 
     ylim=c(0, 1),
     xlim = c(0, max(timeVec[tss])),
     bty="l",
     xlab="Time", 
     ylab="Proportion genetically adapted",
     cex.lab = 1.5)

for (tt in 1:ncol(T9)){
  points(T9[,tt]~timeVec[tss],pch=20)
  lines(T9[,tt]~timeVec[tss])
}

plot(T9c[,1]~timeVec[tss], type = "n", 
     ylim=c(0, 1),
     xlim = c(0, max(timeVec[tss])),
     bty="l",
     xlab="Time", 
     ylab="Proportion culturally adapted",
     cex.lab = 1.5)

for (tt in 1:ncol(T9)){
  points(T9c[,tt]~timeVec[tss],pch=20)
  lines(T9c[,tt]~timeVec[tss])
}

dev.off()
