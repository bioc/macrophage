\name{gse}
\alias{gse}
\docType{data}
\title{Macrophage dataset - Salmon quantification}
\description{Estimated counts, abundance and effective length per gene for macrophage RNA-Seq experiment}
\details{
  This package provides the output of running Salmon on a set
  of 24 RNA-seq samples from Alasoo, et al. (2018).
  For more details on the data and steps used to generate the
  quantification files, please refer to the package vignette.
  For the script used to build the \code{gse} object, see the
  \code{gse_create.R} script in the scripts directory.
}
\usage{
  data("gse")
}
\format{RangedSummarizedExperiment}
\source{FASTQ files from ENA}
\references{
  Alasoo, et al. "Shared genetic effects on chromatin and gene
  expression indicate a role for enhancer priming in immune response",
  Nature Genetics, January 2018 doi: 10.1038/s41588-018-0046-7.
}
\keyword{datasets}
