# To examine evolutionary shift over a long run time.  
  # Comparing T = 1 to T = 0.8, 0.9. at E = 1; h2 = 0.3

source("src/quoll/quollTGFFunctions.R")
source("src/quoll/parameters.R")

#sTime<-system.time({
n<-10 # number of replicates

##################
## Effect of heritability, cultural transmission, and initial CTA efficacy ##
##################

## High ##
K<- 1000
h2<- 0.1
W0<- 0.38
CTAe<-1 #CTA one-trial efficacy
CTAh<-seq(0, 1, 0.1) # CTA cultural transmission rate
yObs<-300 # number of years to iterate over


#arrays for collecting data
pArr<-array(NA, dim = c(yObs, length(CTAh), n)) #array for collecting phneotype data
cArr<-pArr # mean CTA-based phenotype

  for (cc in 1:length(CTAh)){
      cat("Calculating mean phenotypes for quoll model at:",
          "\n K = ", K,
          "\n h2 = ", h2,
          "\n CTAh = ", CTAh[cc],
          "\n CTAe = ", CTAe,
          "\n")
      pb <- txtProgressBar(min = 0, max = n, style = 3)
      #output
      p <-vector() # for gene-based phenotype
      c<-vector() # for CTA- based phenotype
      for (i in 1:n) {
        setTxtProgressBar(pb, i)
        test<-TGF(demPars = pars, 
                  nP = 10, 
                  nN = 1, 
                  nI = 1, 
                  W0 = W0, 
                  f0=0.05,
                  K = K, 
                  s0=0.38, 
                  h2=h2, 
                  burnIn=10, 
                  selGens=yObs,
                  f1=0.9, 
                  outbreeding=FALSE, 
                  nl=10, 
                  H2=1, 
                  alpha=1, 
                  recombRate=50, 
                  CTAh=CTAh[cc],
                  CTAe=CTAe) 
        if (tail(test$n, 1)>1) {
          pArr[, cc, i] <- test$phenGen
          cArr[, cc, i] <- test$phenCTA
        }
      }
      close(pb)
    }

save(pArr, cArr, CTAe, CTAh, h2, file = "out/adaptLongRunK1000h1.RData")

#})

#build the figures

#source("src/quoll/quollSensitivity_H-rangePlot_pArr.R")
#source("src/quoll/quollSensitivity_H-rangePlot.R")
