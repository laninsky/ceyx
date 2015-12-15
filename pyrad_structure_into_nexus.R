#working_dir <- "C:/Users/Alana/Dropbox/ceyx/snapp_4Dec2015"
#file <- "mod_structure.txt"

pyrad_structure_into_nexus <- function(working_dir,file) {

setwd(working_dir)
library(stringr)
temp <- read.table(file,header=FALSE,stringsAsFactors=FALSE,sep=" ")

no_taxa <- dim(temp)[1]/2
no_loci <- dim(temp)[2]-1

outputmatrix <- matrix("",ncol=(no_loci+1),nrow=no_taxa)

outputmatrix[,1] <- temp[(seq(1,(no_taxa*2),2)),1]

for (i in 2:(no_loci+1)) {
for (j in 1:no_taxa) {
if(temp[(j*2),i]==0) {
outputmatrix[j,i] <- "-"
} else {
if(temp[(j*2),i]==temp[((j*2)-1),i]) {
if(temp[(j*2),i]==(unique(temp[(temp[,i]!=0),i])[1])) {
outputmatrix[j,i] <- "0"
} else {
outputmatrix[j,i] <- "2"
}
} else {
outputmatrix[j,i] <- "1"
}
}
}
}

finaloutput <- matrix("",ncol=1,nrow=no_taxa)

for (i in 1:no_taxa) {
temp <- paste0(outputmatrix[i,2:(no_loci+1)],collapse="")
finaloutput[i,1] <- paste(outputmatrix[i,1]," ",temp,sep="")
}

finaloutput <- rbind(finaloutput,";")
finaloutput <- rbind(finaloutput,"End;")
finaloutput <- rbind(finaloutput,"")
finaloutput <- rbind("Matrix",finaloutput)
test <- paste('Format datatype=standard symbols="012" missing=-;',sep="")
finaloutput <- rbind(test,finaloutput)
test <- paste("Dimensions ntax=",no_taxa," nchar=",no_loci,";",sep="")
finaloutput <- rbind(test,finaloutput)
finaloutput <- rbind("Begin data;",finaloutput)
finaloutput <- rbind("",finaloutput)
finaloutput <- rbind("#NEXUS",finaloutput)

write.table(finaloutput,"SNAPP.nex",col.names=FALSE,row.names=FALSE,quote=FALSE)
}

