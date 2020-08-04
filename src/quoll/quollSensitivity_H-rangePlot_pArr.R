
load(file="out/extProbK1000FullSpace.RData")

pdf(file="out/pArr.pdf", width=7, height=7)
par(oma=c(1.5,1.5,1.5,1.5),mar=c(2.5,2.5,2.5,2.5),mfrow=c(2,2))

CTA<-seq(0, 1, 0.1)
h2<- seq(0, 0.5, 0.05)
TVec<-seq(0, 1, 0.1)

transVec<-c(1, 6:11) # Transmission levels to plot
colourVec<-hcl.colors(length(transVec)) # colours for plotting

#plot 1

plot(pArr[ , 1, 6]~h2, type="n", ylim=c(0,1), xlim=c(0, 0.5), axes = FALSE, 
     main=expression(paste("A) Efficacy (", italic("E"), ") = 0")), 
     cex=0.5, xlab="Heritability of toad-smarts", ylab="Extinction probability")

for (tt in 1:length(transVec)){
  points(pArr[,transVec[tt],1]~h2,type="p",pch=20, col= colourVec[tt]) #0  efficacy 
  lines(pArr[,transVec[tt],1]~h2, lty = 3, col= colourVec[tt])
}

axis(side = 1, at = seq(0, 1, by = 0.2), labels = TRUE, tcl = -0.2)
axis(side = 2, at = seq(0, 1, by = 0.2), labels = TRUE, tcl = -0.2)

legend("bottomleft",legend=TVec[transVec], 
       col=colourVec, 
       cex = 0.9, 
       pch = 20,
       lty=3,
       title=expression(paste("Transmission (", italic("T"), ")")))


      
       #plot 2
plot(pArr[ , 1, 4]~h2, type="n", ylim=c(0,1), xlim=c(0, 0.5), axes = FALSE, 
     main=expression(paste("B) Efficacy (", italic("E"), ") = 0.3")),
     cex=0.5, xlab="Heritability of toad-smarts", ylab="Extinction probability")

for (tt in 1:length(transVec)){
  points(pArr[,transVec[tt],4]~h2,type="p",pch=20, col= colourVec[tt]) #0  efficacy 
  lines(pArr[,transVec[tt],4]~h2, lty = 3, col= colourVec[tt])
}

axis(side = 1, at = seq(0, 1, by = 0.2), labels = TRUE, tcl = -0.2)
axis(side = 2, at = seq(0, 1, by = 0.2), labels = FALSE, tcl = -0.2)


#plot 3
plot(pArr[ , 1, 6]~h2, type="n", ylim=c(0,1), xlim=c(0, 0.5), axes = FALSE, 
     main=expression(paste("C) Efficacy (", italic("E"), ") = 0.7")),
     cex=0.5, xlab="Heritability of toad-smarts", ylab="Extinction probability")

for (tt in 1:length(transVec)){
  points(pArr[,transVec[tt],8]~h2,type="p",pch=20, col= colourVec[tt]) #0  efficacy 
  lines(pArr[,transVec[tt],8]~h2, lty = 3, col= colourVec[tt])
}

axis(side = 1, at = seq(0, 1, by = 0.2), labels = TRUE, tcl = -0.2)
axis(side = 2, at = seq(0, 1, by = 0.2), labels = TRUE, tcl = -0.2)


#plot 4
plot(pArr[ , 1, 6]~h2, type="n", ylim=c(0,1), xlim=c(0, 0.5), axes = FALSE, 
     main=expression(paste("D) Efficacy (", italic("E"), ") = 1.0")),
     cex=0.5, xlab="Heritability of toad-smarts", ylab="Extinction probability")

for (tt in 1:length(transVec)){
  points(pArr[,transVec[tt],11]~h2,type="p",pch=20, col= colourVec[tt]) #0  efficacy 
  lines(pArr[,transVec[tt],11]~h2, lty = 3, col= colourVec[tt])
}

axis(side = 1, at = seq(0, 1, by = 0.2), labels = TRUE, tcl = -0.2)
axis(side = 2, at = seq(0, 1, by = 0.2), labels = FALSE, tcl = -0.2)




mtext(text="Proportion genetically adapted",side=2,line=0, cex=0.8, outer=TRUE)
mtext(text=expression(paste("Heritability of toad-smarts (", italic("h"^"2"), ")")),
                      #"Heritability of toad-smarts (h2)",
                      side=1,line=0,cex=0.8, outer=TRUE)

dev.off()
