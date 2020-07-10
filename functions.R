#functions
library(randomForest)

getImage =
  function(vals)
  {
    matrix(as.integer(vals), 28, 28, byrow = TRUE)
  }

draw =
  function(vals,titles="", colors = rgb((255:0)/255, (255:0)/255, (255:0)/255), ...)
  {
    if(!is.matrix(vals))
      vals = getImage(vals)
    m = t(vals)  # transpose the image
    m = m[,nrow(m):1]  # turn up-side-down
    image(m, col = colors, xaxt = "n", yaxt = "n")
    title(main=titles,cex = 1, font.main = 1, line = -2)

  }

missclassLook = function(r,c,p,v,o,title)
  {
    par(mfrow=c(r,c), mar=c(0,0,0,0), oma=c(2,2,3,2))

look1 = sample(which(v!=p),r*c)
if(max(as.numeric(p))==10 & min(as.numeric(p))==1){
  print('max p is 10 min p is 1 - adjusting')
  v=as.numeric(v)-1
  p=as.numeric(p)-1
}
else if(max(as.numeric(p))==9 & min(as.numeric(p))==0){
  print('max p is 9 min p is 0')
  v=as.numeric(v)-1
  p=as.numeric(p)
}
else{
  print('theres a problem with your labels and levels')
}

for(i in look1){
  draw(o[i, -1]*255)
  box()
  text(.05,.5, v[i], cex=2, col="green")
  text(.95,.5, p[i], cex=2, col="red")
}
mtext(title, side=3, line=0, cex=2, col="blue", outer=TRUE)  

#reset plot params after explore
par(mfrow = c(1, 1), mar = c(5, 4, 4, 2) ) 
}
