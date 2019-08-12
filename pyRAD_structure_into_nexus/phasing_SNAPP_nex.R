#working_dir <- "C:/Users/a499a400/Dropbox/ceyx/snapp_4Dec2015"
#filename <- "SNAPP.nex"

phasing_SNAPP_nex <- function(working_dir,filename) {

library(stringr)
setwd(working_dir)
orig_data <- readLines(filename)

no_taxa <- as.numeric(unlist(strsplit((unlist(strsplit((orig_data[(grep("ntax",orig_data))]),"="))[2])," "))[1])

no_char <- as.numeric(unlist(strsplit((unlist(strsplit((orig_data[(grep("ntax",orig_data))]),"="))[3]),";"))[1])

new_data <- matrix("",ncol=(no_char+1),nrow=(2*no_taxa))

for (i in 7:(no_taxa+6)) {
new_data[(((i-6)*2)-1),1] <- paste((unlist(strsplit(orig_data[i]," "))[1]),".A",sep="")

new_data[((i-6)*2),1] <- paste((unlist(strsplit(orig_data[i]," "))[1]),".B",sep="")

temp <- unlist(strsplit((unlist(strsplit(orig_data[i]," "))[2]),""))
zeroes <- which(temp==0)
new_data[(((i-6)*2)-1),(zeroes+1)] <- 0
new_data[((i-6)*2),(zeroes+1)] <- 0

dashes <- which(temp=="-")
new_data[(((i-6)*2)-1),(dashes+1)] <- "-"
new_data[((i-6)*2),(dashes+1)] <- "-"

twos <- which(temp==2)
new_data[(((i-6)*2)-1),(twos+1)] <- 2
new_data[((i-6)*2),(twos+1)] <- 2

ones <- which(temp==1)
new_data[(((i-6)*2)-1),(ones+1)] <- 0
new_data[((i-6)*2),(ones+1)] <- 2
}

finaloutput <- matrix("",ncol=1,nrow=(no_taxa*2))

for (i in 1:(no_taxa*2)) {
temp <- paste0(new_data[i,2:(no_char+1)],collapse="")
finaloutput[i,1] <- paste(new_data[i,1]," ",temp,sep="")
}

finaloutput <- rbind(finaloutput,";")
finaloutput <- rbind(finaloutput,"End;")
finaloutput <- rbind(finaloutput,"")
finaloutput <- rbind("Matrix",finaloutput)
test <- paste('Format datatype=standard symbols="012" missing=-;',sep="")
finaloutput <- rbind(test,finaloutput)
test <- paste("Dimensions ntax=",(no_taxa*2)," nchar=",no_char,";",sep="")
finaloutput <- rbind(test,finaloutput)
finaloutput <- rbind("Begin data;",finaloutput)
finaloutput <- rbind("",finaloutput)
finaloutput <- rbind("#NEXUS",finaloutput)

write.table(finaloutput,"individual_SNAPP.nex",col.names=FALSE,row.names=FALSE,quote=FALSE)

}
