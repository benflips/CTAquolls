## ---------------------------
##
## Script name: haploid.R
##
## Purpose of script: To visualise the haploid nature/nurture model
##
## Author: Ben Phillips
##
## Date Created: 2020-02-24
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
## load up the packages we will need 

## ---------------------------

## load up our functions into memory

## ---------------------------

m <- seq(0, 1, 0.01) # mutation rate
t <- seq(0, 1, 0.01) # cultural transmission

pSpace<-expand.grid(m, t)

pHat<-function(m, t){
  out<-(1-t-m)/((1-t)*(1-m))
  out[(m+t)>1]<-NA
  out
}

eqP <- pHat(pSpace[,1], pSpace[,2])
eqP<-matrix(eqP, nrow = length(m))

pdf(file = "out/haploidEquil.pdf")

  contour(x = m, 
          y = t, 
          z = eqP,
          frame.plot = FALSE,
          xlab = "Mutation rate",
          ylab = "Transmission rate",
          main = "Equilibrium frequency")
  
dev.off()
