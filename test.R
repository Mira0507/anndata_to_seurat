

library(rhdf5)       # required to handle matrix
library(tidyverse)   # required to handle data (optional)
library(Seurat)
library(anndata)     # required to import h5ad files
library(Matrix)      # required to handle matrix
library(reticulate)  # required to use python tools in R

# Import h5ad file using the anndata package
ad <- read_h5ad("skeletalmns.h5ad")

# Explore the object
ad
# AnnData object with n_obs × n_vars = 3305 × 25069
#  │    obs: 'orig.ident', 'nCount_RNA', 'nFeature_RNA', 'integrated_snn_res.0.5', 'seurat_clusters'
#  │    var: 'name'
#  │    obsm: 'X_pca', 'X_umap'

# Explore the data stored in anndata
ad$X[1:5, 1:5]
#  │5 x 5 sparse Matrix of class "dgCMatrix"
#  │                              Xkr4 Gm1992 Gm37381 Rp1 Sox17
#  │AAAGGGCAGTTCATGC>SI-GA-H8 1.997294      .       .   .     .
#  │AACAACCAGGAAGTAG>SI-GA-H8 1.543411      .       .   .     .
#  │AACCATGTCTTCGATT>SI-GA-H8 2.203357      .       .   .     .
#  │AACCTTTAGAATTGTG>SI-GA-H8 2.509481      .       .   .     .
#  │AAGACAAGTTCAAGGG>SI-GA-H8 2.491706      .       .   .     .

# Create a seurat object
seurat <- CreateSeuratObject(counts=ad$X)

# Explore the output
seurat
# │An object of class Seurat
# │3305 features across 25069 samples within 1 assay
# │Active assay: RNA (3305 features, 0 variable features)

