# Naive Bayes:
classifier = naiveBayes(as.factor(l_train) ~ .,
                        data.frame(pc_train),
                        method="class")
pred = predict(classifier,
               data.frame(pc_train),
               type="class")
cf = confusionMatrix(l_train, pred)

#Calculating Final Accuracy
pred = predict(classifier,
               data.frame(pc_valid),
               type="class")
cf = confusionMatrix(l_valid, pred)
cat("classifier Accuracy on Test set:",
    cf$overall['Accuracy'][[1]],"\n")

#plot some misclassifications
title = "Naive Bayes Missclassifications"
missclassLook(3,3,pred,l_valid,o_valid, title)