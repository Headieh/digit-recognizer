#Random Forest
set.seed(seedval)
classifier = randomForest(l_train ~.,
                          data=pc_train,
                          ntree=150,
                          keep.forest=TRUE,
                          do.trace=25)
plot(classifier, main="Out-of-Bag Error vs Trees")

pred = predict(classifier, newdata=pc_train)
cf = confusionMatrix(pred,l_train)

#Calculating Final Accuracy
pred = predict(classifier, pc_valid, type="response")
cf = confusionMatrix(pred, l_valid)
cat("classifier Accuracy on Test set:",
    cf$overall['Accuracy'][[1]],"\n")

#plot some misclassifications
title = "Random Forest Misclassifications"
missclassLook(3, 3, pred, l_valid, o_valid, title)