
load(file="out/extProbK1000FullSpace.RData")

pdf(file="out/cArr.pdf", width=7, height=7)
par(oma=c(1.5,1.5,1.5,1.5),mar=c(2.5,2.5,2.5,2.5),mfrow=c(2,2))

CTA<-seq(0, 1, 0.1)
h2<- seq(0, 0.5, 0.05)

#plot 1

plot(cArr[ , 1, 6]~h2, type="n", ylim=c(0,1), xlim=c(0, 0.65), axes = FALSE, 
     main=expression(paste("Efficacy (", italic("E"), ") = 0")), 
     cex=0.5, xlab="Heritability of toad-smarts", ylab="Extinction probability")

points(cArr[,1,1]~h2,type="p",pch=20, col= "black") #0  efficacy 
points(cArr[,6,1]~h2,type="p",pch=20, col= "darkgreen") #0.5 
points(cArr[,7,1]~h2,type="p",pch=20, col="red") #1
points(cArr[,8,1]~h2,type="p",pch=20, col="brown") #1
points(cArr[,9,1]~h2,type="p",pch=20, col="deeppink") #1
points(cArr[,10,1]~h2,type="p",pch=20, col="blue") #1
points(cArr[,11,1]~h2,type="p",pch=20, col="green") #1

axis(side = 1, at = seq(0, 1, by = 0.2), labels = TRUE, tcl = -0.2)
axis(side = 2, at = seq(0, 1, by = 0.2), labels = TRUE, tcl = -0.2)

#connect points
for(rr in unique(cArr)){
  lines(cArr[,1,1]~h2,type="l",lty=3,lwd= 1, col= "black")}

for(rr in unique(cArr)){
  lines(cArr[,6,1]~h2,type="l",lty=3,lwd= 1, col= "darkgreen")}

for(rr in unique(cArr)){
  lines(cArr[,7,1]~h2,type="l",lty=3,lwd= 1, col= "red")}

for(rr in unique(cArr)){
  lines(cArr[,8,1]~h2,type="l",lty=3,lwd= 1, col= "brown")}
for(rr in unique(cArr)){
  lines(cArr[,9,1]~h2,type="l",lty=3,lwd= 1, col= "deeppink")}
for(rr in unique(cArr)){
  lines(cArr[,10,1]~h2,type="l",lty=3,lwd= 1, col= "blue")}
for(rr in unique(cArr)){
  lines(cArr[,11,1]~h2,type="l",lty=3,lwd= 1, col= "green")}

       
       #plot 2
plot(cArr[ , 1, 6]~h2, type="n", ylim=c(0,1), xlim=c(0, 0.65), axes = FALSE, 
     main=expression(paste("Efficacy (", italic("E"), ") = 0.5")),
     cex=0.5, xlab="Heritability of toad-smarts", ylab="Extinction probability")

points(cArr[,1,6]~h2,type="p",pch=20, col= "black") #0  efficacy 
points(cArr[,6,6]~h2,type="p",pch=20, col= "darkgreen") #0.5 
points(cArr[,7,6]~h2,type="p",pch=20, col="red") #1
points(cArr[,8,6]~h2,type="p",pch=20, col="brown") #1
points(cArr[,9,6]~h2,type="p",pch=20, col="deeppink") #1
points(cArr[,10,6]~h2,type="p",pch=20, col="blue") #1
points(cArr[,11,6]~h2,type="p",pch=20, col="green") #1

axis(side = 1, at = seq(0, 1, by = 0.2), labels = TRUE, tcl = -0.2)
axis(side = 2, at = seq(0, 1, by = 0.2), labels = FALSE, tcl = -0.2)

#connect points
for(rr in unique(cArr)){
  lines(cArr[,1,6]~h2,type="l",lty=3,lwd= 1, col= "black")}

for(rr in unique(cArr)){
  lines(cArr[,6,6]~h2,type="l",lty=3,lwd= 1, col= "darkgreen")}

for(rr in unique(cArr)){
  lines(cArr[,7,6]~h2,type="l",lty=3,lwd= 1, col= "red")}

for(rr in unique(cArr)){
  lines(cArr[,8,6]~h2,type="l",lty=3,lwd= 1, col= "brown")}
for(rr in unique(cArr)){
  lines(cArr[,9,6]~h2,type="l",lty=3,lwd= 1, col= "deeppink")}
for(rr in unique(cArr)){
  lines(cArr[,10,6]~h2,type="l",lty=3,lwd= 1, col= "blue")}
for(rr in unique(cArr)){
  lines(cArr[,11,6]~h2,type="l",lty=3,lwd= 1, col= "green")}



legend("topright",legend=c ("0","0.5","0.6","0.7","0.8","0.9","1.0"), col=c("black", "darkgreen","red","brown","deeppink","blue","green"), cex = 0.5, 
       lty=3,
       title=expression(paste("Transmission (", italic("T"), ")")))


#plot 3
plot(cArr[ , 1, 6]~h2, type="n", ylim=c(0,1), xlim=c(0, 0.65), axes = FALSE, 
     main=expression(paste("Efficacy (", italic("E"), ") = 0.7")),
     cex=0.5, xlab="Heritability of toad-smarts", ylab="Extinction probability")

points(cArr[,1,8]~h2,type="p",pch=20, col= "black") #0  efficacy 
points(cArr[,6,8]~h2,type="p",pch=20, col= "darkgreen") #0.5 
points(cArr[,7,8]~h2,type="p",pch=20, col="red") #1
points(cArr[,8,8]~h2,type="p",pch=20, col="brown") #1
points(cArr[,9,8]~h2,type="p",pch=20, col="deeppink") #1
points(cArr[,10,8]~h2,type="p",pch=20, col="blue") #1
points(cArr[,11,8]~h2,type="p",pch=20, col="green") #1

axis(side = 1, at = seq(0, 1, by = 0.2), labels = TRUE, tcl = -0.2)
axis(side = 2, at = seq(0, 1, by = 0.2), labels = TRUE, tcl = -0.2)

#connect points
for(rr in unique(cArr)){
  lines(cArr[,1,8]~h2,type="l",lty=3,lwd= 1, col= "black")}

for(rr in unique(cArr)){
  lines(cArr[,6,8]~h2,type="l",lty=3,lwd= 1, col= "darkgreen")}

for(rr in unique(cArr)){
  lines(cArr[,7,8]~h2,type="l",lty=3,lwd= 1, col= "red")}

for(rr in unique(cArr)){
  lines(cArr[,8,8]~h2,type="l",lty=3,lwd= 1, col= "brown")}
for(rr in unique(cArr)){
  lines(cArr[,9,8]~h2,type="l",lty=3,lwd= 1, col= "deeppink")}
for(rr in unique(cArr)){
  lines(cArr[,10,8]~h2,type="l",lty=3,lwd= 1, col= "blue")}
for(rr in unique(cArr)){
  lines(cArr[,11,8]~h2,type="l",lty=3,lwd= 1, col= "green")}


#plot 4
plot(cArr[ , 1, 6]~h2, type="n", ylim=c(0,1), xlim=c(0, 0.65), axes = FALSE, 
     main=expression(paste("Efficacy (", italic("E"), ") = 1.0")),
     cex=0.5, xlab="Heritability of toad-smarts", ylab="Extinction probability")

points(cArr[,1,11]~h2,type="p",pch=20, col= "black") #0  efficacy 
points(cArr[,6,11]~h2,type="p",pch=20, col= "darkgreen") #0.5 
points(cArr[,7,11]~h2,type="p",pch=20, col="red") #1
points(cArr[,8,11]~h2,type="p",pch=20, col="brown") #1
points(cArr[,9,11]~h2,type="p",pch=20, col="deeppink") #1
points(cArr[,10,11]~h2,type="p",pch=20, col="blue") #1
points(cArr[,11,11]~h2,type="p",pch=20, col="green") #1

axis(side = 1, at = seq(0, 1, by = 0.2), labels = TRUE, tcl = -0.2)
axis(side = 2, at = seq(0, 1, by = 0.2), labels = FALSE, tcl = -0.2)

#connect points
for(rr in unique(cArr)){
  lines(cArr[,1,11]~h2,type="l",lty=3,lwd= 1, col= "black")}

for(rr in unique(cArr)){
  lines(cArr[,6,11]~h2,type="l",lty=3,lwd= 1, col= "darkgreen")}

for(rr in unique(cArr)){
  lines(cArr[,7,11]~h2,type="l",lty=3,lwd= 1, col= "red")}

for(rr in unique(cArr)){
  lines(cArr[,8,11]~h2,type="l",lty=3,lwd= 1, col= "brown")}
for(rr in unique(cArr)){
  lines(cArr[,9,11]~h2,type="l",lty=3,lwd= 1, col= "deeppink")}
for(rr in unique(cArr)){
  lines(cArr[,10,11]~h2,type="l",lty=3,lwd= 1, col= "blue")}
for(rr in unique(cArr)){
  lines(cArr[,11,11]~h2,type="l",lty=3,lwd= 1, col= "green")}



mtext(text="Proportion with learned avoidance",side=2,line=0, cex=0.8, outer=TRUE)
mtext(text=expression(paste("Heritability of toad-smarts (", italic("h2"), ")")),
                      #"Heritability of toad-smarts (h2)",
                      side=1,line=0,cex=0.8, outer=TRUE)

dev.off()
