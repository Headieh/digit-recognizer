#K Nearst Neighbors
#Calculating Final Accuracy
classifier = knn(train=pc_train,
                 test=pc_valid,
                 cl=l_train,
                 k=floor(sqrt(nrow(pc_train))))
cf = confusionMatrix(l_valid, classifier)
cat("classifier Accuracy on Test set:", 
    cf$overall['Accuracy'][[1]],"\n")

#plot some misclassifications
title = "KNN Missclassifications"
missclassLook(3, 3, classifier, l_valid, o_valid, title)
