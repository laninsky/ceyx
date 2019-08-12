# pyRAD_structure_into_nexus
Take a structure file with no locus/SNP header row or population identifier row and convert it into a nexus format. After pasting the script into R (or sourcing it), usage is:

pyrad_structure_into_nexus("working_dir","filename")

e.g. pyrad_structure_into_nexus("C:/Users/Alana/Dropbox/ceyx/snapp_4Dec2015","mod_structure.txt")

The output will be placed in your working directory, and will be named "SNAPP.nex"

This script will also work on the structure.txt/mod_structure.txt file output by https://github.com/laninsky/ambigoos_into_structure

# Phasing individuals into alleles
If you don't have two individuals per defined species, you might want to represent each individual by its two alleles per SNP locus so that you can have coalescent events within species. The phasing_SNAPP.nex.R function will do this for you based on the nexus file you generated in the step above. After pasting the script into R (or sourcing it), usage is:

phasing_SNAPP_nex("working_dir","filename")

e.g. phasing_SNAPP_nex("C:/Users/a499a400/Dropbox/ceyx/snapp_4Dec2015","SNAPP.nex")

The output will be placed in your working directory, and will be named "individual_SNAPP.nex"

### Version history
v0.0 version used in ceyx TBD

This script wouldn't be possible without:
R: R Core Team. 2015. R: A language and environment for statistical computing. URL http://www.R-project.org/. R Foundation for Statistical Computing, Vienna, Austria. https://www.r-project.org/

Wickham, H., stringr: Simple, Consistent Wrappers for Common String Operations
