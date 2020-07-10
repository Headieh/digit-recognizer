setwd("~/Documents/code/digit-recognizer")

#INITIALIZE
source('functions.r')
set.seed(5)
listofpackages <- c("caret", 
                    "e1071",
                    "nnet", #nnet
                    "MASS",#QDA
                    "class",#knn
                    "RColorBrewer")

new.packages <- listofpackages[!(listofpackages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages)
lapply(listofpackages, require, character.only = TRUE)

#EXPLORE DATA
source('analytics/explore.r')

#PCA
source('analytics/PCA.R')

#Analytics
pc = proc.time()
source('analytics/NN.R') #2307.751s 0.9712381
proc.time() - pc

pc = proc.time()
source('analytics/SVM.R') #526.927s 0.9706667
proc.time() - pc

pc = proc.time()
source('analytics/knn.R') #103.229s 0.9195238
proc.time() - pc

pc = proc.time()
source('analytics/RandomForest.R') #101.017s 0.9418095
proc.time() - pc

pc = proc.time()
source('analytics/bayes.R') #70.993s 0.855619 
proc.time() - pc

pc = proc.time()
source('analytics/QDA.R') #9.612s 0.9489524 
proc.time() - pc
