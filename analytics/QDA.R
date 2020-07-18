#Quadratic Discriminant Analysis
set.seed(seedval)
classifier = qda(pc_train, l_train)
pred = predict(classifier, pc_train)
cf = table(Predicted = pred$class, True = l_train)
acc = mean(pred$class == l_train)

#Calculating Final Accuracy
pred = predict(classifier, pc_valid)
cf = table(Predicted = pred$class, True = l_valid)
acc = mean(pred$class == l_valid)
cat("classifier Accuracy on Test set:", acc,"\n")

#plot some misclassifications
title = "QDA Misclassifications"
missclassLook(3, 3, pred$class, l_valid, o_valid, title)