## ---------------------------
##
## Script name: concatenate HPC
##
## Purpose of script: loop through HPC outputs and build a single array of output
##
## Author: Ben Phillips
##
## Date Created: 2020-03-03
##
## Copyright (c) Ben Phillips, 2020
## Email: phillipsb@unimelb.edu.au
##
## ---------------------------
##
## Notes:
##   
##
##
h2<- seq(0, 0.5, 0.05)
CTAe<-seq(0, 1, 0.1) #CTA one-trial efficacy
CTAh<-seq(0, 1, 0.1)

#arrays for collecting data
prOut<-array(NA, dim = c(length(h2), length(CTAh), length(CTAe))) #extinction prob
pArrOut<-prOut # mean gene-based phenotype
cArrOut<-prOut # mean CTA-based phenotype

for (cc in 1:length(CTAh)){
  for (ee in 1:length(CTAe)){
    fName <- paste0("out/extProbWithTransmission_", cc, "_", ee, ".RData")
    load(fName)
    prOut[, cc, ee] <- pr
    pArrOut[, cc, ee] <- pArr
    cArrOut[, cc, ee] <- cArr
  }
}

pr<-prOut
pArr<-pArrOut
cArr<-cArrOut

save(h2, CTAe, CTAh, pr, pArr, cArr, file = "out/extProbK1000FullSpace.RData")