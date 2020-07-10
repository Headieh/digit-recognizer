#LOAD DATA
trainingdata <- read.csv('data/train.csv')

#EXPLORE DATA
cat('number of observations in training data:', nrow(trainingdata), '\n')
cat('number of columns in training data:', ncol(trainingdata), '\n')

COLORS <- c("white", "black")
CUSTOM_COLORS <- colorRampPalette(colors = COLORS)
CUSTOM_COLORS_PLOT <- colorRampPalette(brewer.pal(10, "Set3"))

trainTable = table(trainingdata$label)
percentage <- round(trainTable/sum(trainTable) * 100)
labels <- paste0(row.names(trainTable), " (", percentage, "%) ")
pie(trainTable, labels = labels, col = CUSTOM_COLORS_PLOT(10), main = "Total Number of Digits")

draw(trainingdata[1,-1], "1st Image")

#first 100 images
options(width = 60)
par(mfrow = c(10, 10), mar = rep(0, 4))
invisible(sapply(1:100, function(i) draw(trainingdata[i, -1])))

a = split(trainingdata, trainingdata$label)
names(a)
# all with the same label as the 4th item in data
invisible(sapply(1:100, function(i) draw(a[[4]][i, -1])))
# all data labeled 4s
invisible(sapply(1:100, function(i) draw(a[["4"]][i, -1])))

par(mfrow = c(1, 1))
draw(sapply(a[["1"]][, -1], sd), "Standard Deviation of 1s")
draw(colMeans(a[["1"]][,-1]), "Average Image of 1s")

#reset plot params after explore
par(mfrow = c(1, 1), mar = c(5, 4, 4, 2) ) 
