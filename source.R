setwd("~/Documents/code/digit-recognizer")

#INITIALIZE
source('functions.r')
seedval=5
set.seed(seedval)

#EXPLORE DATA
source('analytics/explore.r')

#PCA
source('analytics/PCA.R')

#ANALYTICS

#NaiveBayes
#Time to run: 70.993s 
#Accuracy: 0.855619
pc = proc.time()
source('analytics/bayes.R')
proc.time() - pc

#Neural Networks
#Time to run: 2307.751s 
#Accuracy: 0.9698095
pc = proc.time()
source('analytics/NN.R')
proc.time() - pc

#Support-Vector Machines
#Time to run: 526.927s 
#Accuracy: 0.9706667
pc = proc.time()
source('analytics/SVM.R')
proc.time() - pc

#K Nearest Neighbors
#Time to run: 103.229s
#Accuracy: 0.9195238
pc = proc.time()
source('analytics/knn.R')
proc.time() - pc

#Random Forests
#Time to run: 101.017s
#Accuracy: 0.9455238
pc = proc.time()
source('analytics/RandomForest.R')
proc.time() - pc

#Quadratic Discriminant Analysis
#Time to run: 9.612s
#Accuracy: 0.9489524
pc = proc.time()
source('analytics/QDA.R')
proc.time() - pc
