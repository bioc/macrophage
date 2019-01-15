prj <- read.delim("PRJEB18997.txt")
supp1 <- read.csv("supp_table_1.csv")
supp7 <- read.csv("supp_table_7.csv")
table(supp1$line_id %in% supp7$line_id)
table(supp7$biosamples_accession %in% prj$sample_accession)
table(supp1$sex, supp1$received_as)
library(dplyr)
library(magrittr)
prj %<>% filter(library_strategy == "RNA-Seq")
supp7 %<>% filter(biosamples_accession %in% prj$sample_accession)
supp7$line_id %<>% droplevels
supp1 %<>% filter(line_id %in% supp7$line_id & sex == "female" & received_as == "frozen")
supp1$line_id
table(supp1$status)
#hist(supp1$mean_purity)
supp1 %>% arrange(-mean_purity) %>% head(6) %>% pull(line_id) -> lines
table(supp7$line_id %in% lines)
supp7 %<>% filter(line_id %in% lines)
prj %<>% filter(sample_accession %in% supp7$biosamples_accession)
prj$sample_accession %<>% droplevels
table(prj$sample_accession)
write(as.character(prj$run_accession), file="errs", ncolumns=1)

run.list <- split(prj$run_accession, prj$sample_accession) # split into list
setwd("/pine/scr/m/i/milove/macrophage")
for (i in seq_len(24)) {
  print(i)
  system(paste0("cat ", paste(paste0(run.list[[i]],".sra_1.fastq"),collapse=" ")," > ",names(run.list)[i],"_1.fastq"))
  system(paste0("cat ", paste(paste0(run.list[[i]],".sra_2.fastq"),collapse=" ")," > ",names(run.list)[i],"_2.fastq"))
}

