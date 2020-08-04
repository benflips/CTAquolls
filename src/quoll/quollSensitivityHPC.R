source("src/quoll/quollTGFFunctions.R")
source("src/quoll/parameters.R")


# get command line arguments
  #  which will be cc, ee
args = (commandArgs(TRUE))

for (aa in 1:length(args)) {eval(parse(text = args[[aa]]))}

#sTime<-system.time({
n<-100 # number of iterations (test) for PVA

##################
## Effect of heritability, cultural transmission, and initial CTA efficacy ##
##################

## High ##
K<- 1000
h2<- seq(0, 0.5, 0.05)
W0<- 0.38
CTAe<-seq(0, 1, 0.1) #CTA one-trial efficacy
CTAh<-seq(0, 1, 0.1) # CTA cultural transmission rate


#arrays for collecting data
pr<-rep(NA, length = length(h2)) #array(NA, dim = c(length(h2), length(CTAh), length(CTAe))) #extinction prob
pArr<-pr # mean gene-based phenotype
cArr<-pr # mean CTA-based phenotype
nArr<-pr # mean population size

# for (ee in 1:length(CTAe)){
#   for (cc in 1:length(CTAh)){
    for (hh in 1:length(h2)){
      cat("Calculating extinction probability for quoll model at:",
          "\n K = ", K,
          "\n h2 = ", h2[hh],
          "\n CTAh = ", CTAh[cc],
          "\n CTAe = ", CTAe[ee],
          "\n")
      pb <- txtProgressBar(min = 0, max = n, style = 3)
      #output
      e <-vector() # for extinction
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
                  h2=h2[hh], 
                  burnIn=10, 
                  f1=0.9, 
                  outbreeding=FALSE, 
                  nl=10, 
                  H2=1, 
                  alpha=1, 
                  recombRate=50, 
                  CTAh=CTAh[cc],
                  CTAe=CTAe[ee])    
        
        e[i]<-tail(test$n,1)<=1 #extinct?
        if (!e[i]) {p[i]<-tail(test$phenGen,1) # if not, collect phenotype data
          c[i]<-tail(test$phenCTA,1)
        }
      }
      save(e, c, p, file = paste0("out/parSpace/hTE_", hh, "_", cc, "_", ee, ".RData"))
      close(pb)
      pr[hh]<-length(e[e==TRUE])/n
      pArr[hh]<-mean(p, na.rm = TRUE)
      cArr[hh]<-mean(c, na.rm = TRUE)
    }
#   }
# }

save(pr, pArr, cArr, CTAe, CTAh, h2, file = paste0("out/extProbWithTransmission_", cc, "_", ee, ".RData"))

#})

#build the figures

#source("src/quoll/quollSensitivity_H-rangePlot_pArr.R")
#source("src/quoll/quollSensitivity_H-rangePlot.R")
