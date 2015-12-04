working_dir <- "C:/Users/a499a400/Dropbox/ceyx/snapp_4Dec2015"
file <- "project_data.txt"

pyrad_structure_into_nexus <- function(working_dir,file) {

setwd(working_dir)
library(stringr)
temp <- read.table(file,header=FALSE,stringsAsFactors=FALSE,sep=" ")

no_taxa <- dim(temp)[1]/2
no_loci <- dim(temp)[2]-1

outputmatrix <- matrix("",ncol=(no_loci+1),nrow=no_taxa)
