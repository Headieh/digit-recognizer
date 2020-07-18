#Support Vector Machine
set.seed(seedval)
classifier = svm(l_train ~ .,
                 data.frame(pc_train),
                 method="class")
pred = predict(classifier, data.frame(pc_train))
cf = confusionMatrix(l_train, pred)

#Calculating Final Accuracy
pred = predict(classifier, data.frame(pc_valid))
cf = confusionMatrix(l_valid, pred)
cat("classifier Accuracy on Test set:",
    cf$overall['Accuracy'][[1]],"\n")

#plot some misclassifications
title = "SVM Misclassifications"
missclassLook(3, 3, pred, l_valid, o_valid, title)