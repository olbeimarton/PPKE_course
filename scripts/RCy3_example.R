# Accompanying R script of the Cytoscape / RCy3 demonstration
# Author: Marton Olbei
# Date: 30/09/2021

library(RCy3)

# Make sure to open Cytoscape first, and load the network you'd like to analyse
# in this short example we're going to work on DummyNetwork.cys (in GitHub repo).
# You can load networks into Cytoscape using RCy3, but that is outside the scope of this
# tutorial. However, the RCy3 documentation is very thorough, so if you are interested
# please do give it a read. http://cytoscape.org/RCy3/articles/Network-functions-and-visualization.html

# First, let's see if we are connected to cytoscape
cytoscapePing()

# Let's change the layout of the network
# List available layouts
getLayoutNames()

# Change layouts
layoutNetwork('grid')
layoutNetwork('kamada-kawai')
layoutNetwork('circular')


# Change other visual properties
# default node size
setNodeSizeDefault(new.size = 50)

# select just a subset of nodes
selectNodes(nodes=c('BTRC', 'SMAD5', 'PML'), by.col = 'name')

# change node size for selected nodes
setNodeSizeBypass(c('BTRC', 'SMAD5', 'PML'), new.sizes = 100)

# clear bypass
clearNodePropertyBypass('NODE_SIZE')

# colour nodes by 'expression'
setNodeColorMapping(table.column = 'Expression1',
                    table.column.values = c(-5,0,5),
                    colors = c('#5577FF','#FFFFFF','#FF7755')
                    )

# analyze network to get various network statistics
analyzeNetwork(directed = F)

# change node size according to degree
setNodeSizeMapping(table.column = 'Degree',
                   table.column.values = c(1,18),
                   sizes = c(15,100))
