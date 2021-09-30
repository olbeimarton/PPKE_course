# Accompanying R script of the Cytoscape / RCy3 demonstration
# Author: Marton Olbei
# Date: 30/09/2021

library(igraph)
# read the input file
g<-read_graph('../data_files/DummyNetwork.graphml', format = c('graphml'))
# plot it in R!
plot(g)

#look at vetrex (node) data
V(g)

#look at edge data
E(g)

#calculate degree
deg <- degree(g, mode="all")

#use it as node size
V(g)$size <- deg*3


#use a layout
plot(g, layout=layout.circle(g))

#use names only
plot(g, edge.arrow.size=.4, edge.curved=.1, edge.color="orange",
     vertex.color="orange", vertex.frame.color="#ffffff",vertex.label.color="black")

#These are just some example commands, for an in-depth walkthrough I highly recommend 
#Katya Ognyanova's tutorial: https://kateto.net/network-visualization