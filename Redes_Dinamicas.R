#Borrar todas las variables cargadas.
rm(list=ls()) 

setwd("...")

library(ndtv)
library(tergm)

# Creación de una red no dirigida.
# An undirected graph is graph, i.e., a set of objects (called vertices or nodes)
# that are connected together, where all the edges are bidirectional.

myfamily <- network.initialize(15,directed = FALSE)
plot(myfamily, displaylabels=FALSE, vertex.col=4, vertex.cex=3, edge.col=2, edge.lwd=5)
plot(myfamily, displaylabels=TRUE,  vertex.col=4, vertex.cex=3, edge.col=2, edge.lwd=5)

add.edge(myfamily,13,15)
plot(myfamily, displaylabels=TRUE,  vertex.col=4, vertex.cex=3, edge.col=2, edge.lwd=5)

# Creación de un red dirigida.

mivilla<-network.initialize(25,directed=TRUE)
plot(mivilla,displaylabels=TRUE, vertex.col=4,vertex.cex=3,edge.col=2,edge.lwd=5)
add.edge(mivilla,20,21)
plot(mivilla,displaylabels=TRUE, vertex.col=4,vertex.cex=3,edge.col=2,edge.lwd=5)

add.edges.active(mivilla,tail = 1:9, head=c(2:9,1),onset=1:9, terminus = 11)
plot(mivilla,displaylabels=TRUE, vertex.col=4,vertex.cex=3,edge.col=2,edge.lwd=5)

add.edges.active(mivilla,tail = 10, head=c(1:9),onset=10, terminus = 12)
plot(mivilla,displaylabels=TRUE, vertex.col=4,vertex.cex=3,edge.col=2,edge.lwd=5)

add.edges.active(mivilla,tail = 11, head=c(12:19),onset=10:15, terminus = 16:32)
add.edges.active(mivilla,tail = c(1,2), head=c(3:25),onset=3:11, terminus = 14:20)

plot(mivilla,displaylabels=TRUE, vertex.col=4,vertex.cex=3,edge.col=2,edge.lwd=5)


# Animación de la creación de la red neuronal.

render.par=list(tween.frames=5,show.time=TRUE, show.stats="~edges+gwesp(0,fixed=TRUE)")

#myanimation<-render.animation(mivilla,render.par=render.par)

render.d3movie(mivilla,render.par = render.par,edge.col="green",displaylabels=TRUE,
               plot.edge.spells=TRUE,label.cex=1.2,label.col="blue",filename = paste0(getwd(), "/movie.html"))

myunlist<-data.frame(mivilla)
View(myunlist)





