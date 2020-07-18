#K Nearst Neighbors
#Calculating Final Accuracy
set.seed(seedval)
cat("K Neighbors:", floor(sqrt(nrow(pc_train))),"\n")
classifier = knn(train=pc_train,
                 test=pc_valid,
                 cl=l_train,
                 k=floor(sqrt(nrow(pc_train))))
cf = confusionMatrix(l_valid, classifier)
cat("classifier Accuracy on Test set:", 
    cf$overall['Accuracy'][[1]],"\n")

#plot some misclassifications
title = "KNN Misclassifications"
missclassLook(3, 3, classifier, l_valid, o_valid, title)
