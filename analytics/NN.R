#Neural Networks
set.seed(seedval)
classifier = nnet(pc_train,
                  class.ind(l_train),
                  size=150,
                  softmax=TRUE,
                  MaxNWts = 80000)
pred = predict(classifier,
               pc_train,
               type="class")
acc = mean(pred == l_train)

#Calculating Final Accuracy
pred = predict(classifier,
               pc_valid,
               type="class")
acc = mean(pred == l_valid)
cat("classifier Accuracy on Test set:", acc,"\n")

#plot some misclassifications
title = "NN Misclassifications"
missclassLook(3, 3, pred, l_valid, o_valid, title)


