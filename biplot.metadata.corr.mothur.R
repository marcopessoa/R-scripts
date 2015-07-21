# R script to create an NMDS or PCoA plot in R using mothur output
# Also will add arrows and labels, as in a biplot, to show which OTUs or metadata are correlated with shifts in microbial communities
# Make sure to add a column header "group" above your point labels in .thetayc.1.lt.nmds.axes file if absent
# Kristina Fontanez, July 2011
#
# Modified by Marco Pessoa, July 2015
# Modified 'cx' arguments to 'cex' in textxy functions -- Marco Pessoa, July 2015
# Modified 'points$Taxonomy' to 'points$Feature' when defining 'labels' -- Marco Pessoa, July 2015
# Modified file names to generic file names which can be modified by users -- Marco Pessoa, July 2015


library(calibrate)
library(shape)
#-------------------------------------------------------------------- 
#Sends the output to a pdf file
#--------------------------------------------------------------------
pdf("my_output_file.pdf")

#--------------------------------------------------------------------
#Read in the nmds or pcoa axes file
#--------------------------------------------------------------------
A <-read.table("my.nmds.or.pcoa.axes.file", header=T)

#--------------------------------------------------------------------
# Make the plot, add axis labels and set the x,y limits (change as needed)
#--------------------------------------------------------------------
plot(A$axis1, A$axis2, col=1, pch=20, type="p", xlab="axis 1 title", ylab="axis 2 title", main="plot title", xlim=c(-1.5,1.5), ylim=c(-1.5,1.5))


#--------------------------------------------------------------------
#Add labels to the points
#--------------------------------------------------------------------
textxy(A$axis1, A$axis2, A$group,cex=1)

#--------------------------------------------------------------------
#Read in the correlation datafile (Result of corr.axes function) and set up variables
#--------------------------------------------------------------------
points<-read.table("my.pearson.or.spearman.corr.axes", header=T)
x1<-points$axis1
y1<-points$axis2
labels<-points$Feature

#--------------------------------------------------------------------
#Add arrows and labels showing which OTUs or metadata are correlated with shifts in community 
#--------------------------------------------------------------------
Arrows(0,0,x1,y1,code=2,arr.length=0.3,arr.width=0.3,arr.type="triangle",arr.adj=1)
textxy(x1,y1,labels,cex=0.8)

#--------------------------------------------------------------------
#Shut down current graphic device
#--------------------------------------------------------------------
dev.off() 
