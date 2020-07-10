cat('STANDARDIZING DATA\n')
cat('range of pixel values', range(trainingdata[,names(trainingdata) != "label"]), '\n')
trainingdata[,names(trainingdata) != "label"] = trainingdata[,names(trainingdata) != "label"]/max(trainingdata)

cat('COMPUTING PRINCIPLE COMPONENTS\n')
#reduces dimensionality and keep the most relevant

#or use prcomp function
S=cov(trainingdata[,names(trainingdata) != "label"])
eig = eigen(S, symmetric = TRUE)
# Identify the amount of variance explained by the PCs
var_expl = cumsum(eig$values) / sum(eig$values)
k = match(TRUE, var_expl > 0.95) # 154

P=plot(1:length(var_expl),var_expl,type="b",xlim=c(0,k+100),
       main="Top Components",
       xlab="# of Components",ylab="Var")
abline(v=k, h=0.95, lty=2)

pc_tr = as.matrix(trainingdata[,names(trainingdata) != "label"]) %*% eig$vectors[, 1:k]
l_tr = as.factor(trainingdata[,"label"])

cat('SPLITING TRAIN DATA FOR VALIDATION\n')
splittrain = sample(nrow(pc_tr), nrow(pc_tr)*0.75)
pc_train = pc_tr[splittrain,]
o_train = trainingdata[splittrain,]
l_train = as.factor(trainingdata[splittrain,"label"])
pc_valid = pc_tr[-splittrain,]
l_valid = as.factor(trainingdata[-splittrain,"label"])
o_valid = trainingdata[-splittrain,]

pc_tTable = table(l_train)
percentage = round(pc_tTable/sum(pc_tTable) * 100)
labels = paste0(row.names(pc_tTable), " (", percentage, "%) ")

pie(pc_tTable, 
    labels=labels,
    col=CUSTOM_COLORS_PLOT(10),
    main="Total Number of Digits (Training Set)",
    sub=paste("# of Obs", nrow(pc_train))
    )
plot = plot(l_train, col=CUSTOM_COLORS_PLOT(10), 
             main="Total Number of Digits (Training Set)", 
             sub=paste("# of Obs", nrow(pc_train)),
             ylim=c(0, 4000), ylab="Counts of Digits")
text(x=plot, y=pc_tTable+100, labels=pc_tTable, cex=0.75)

pc_vTable = table(l_valid)
percentage = round(pc_vTable/sum(pc_vTable) * 100)
labels = paste0(row.names(pc_vTable), " (", percentage, "%) ")

pie(pc_vTable, 
    labels=labels,
    col=CUSTOM_COLORS_PLOT(10),
    main="Total Number of Digits (Validating Set)",
    sub=paste("# of Obs", nrow(pc_valid))
)
plot = plot(l_valid, col=CUSTOM_COLORS_PLOT(10), 
             main="Total Number of Digits (Validating Set)", 
             sub=paste("# of Obs", nrow(pc_valid)),
             ylim=c(0, 1300), ylab="Counts of Digits")
text(x=plot, y=pc_vTable+30, labels=pc_vTable, cex=0.75)

