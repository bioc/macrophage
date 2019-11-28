library(SummarizedExperiment)
library(tximeta)
library(org.Hs.eg.db)
library(macrophage)
dir <- system.file("extdata", package="macrophage")
coldata <- read.csv(file.path(dir, "coldata.csv"))
coldata$files <- file.path(dir, "quants", coldata$names, "quant.sf.gz")
coldata$condition <- coldata$condition_name
coldata$line <- coldata$line_id
coldata$condition <- relevel(coldata$condition, "naive")
se <- tximeta(coldata, dropInfReps=TRUE)
gse <- summarizeToGene(se)
gse <- addIds(gse, "SYMBOL", gene=TRUE)
save(gse, file="gse.rda", compress="xz")
