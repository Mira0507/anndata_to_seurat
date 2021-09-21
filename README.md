## From Python Anndata to R Seurat Object

- **Anndata (.h5ad)** in Python = **HDF5 (.h5)** in R
- Anndata is used to store single cell analysis data

### References and manuals

- [anndata for R](https://anndata.dynverse.org)
- [Seurat](https://satijalab.org/seurat/articles/pbmc3k_tutorial.html)
- [Matrix](https://cran.r-project.org/web/packages/Matrix/index.html)

### Conda environment: [requirements.txt](https://github.com/Mira0507/anndata_to_seurat/blob/master/requirements.txt)

### Workflow

This workflow demonstrates how to convert python anndata to R seurat object through R dgCMatrix object

1. Load packages

```r
library(rhdf5)       # required to handle matrix
library(tidyverse)   # required to handle data (optional)
library(Seurat)
library(anndata)     # required to import h5ad files
library(Matrix)      # required to handle matrix
library(reticulate)  # required to use python tools in R
```

2. Import h5ad file to dgCMatrix in R

```r
ad <- read_h5ad("skeletalmns.h5ad")
ad
# AnnData object with n_obs × n_vars = 3305 × 25069
#  │    obs: 'orig.ident', 'nCount_RNA', 'nFeature_RNA', 'integrated_snn_res.0.5', 'seurat_clusters'
#  │    var: 'name'
#  │    obsm: 'X_pca', 'X_umap'
```

3. Explore read counts

```r
ad$X[1:5, 1:5]
#  │5 x 5 sparse Matrix of class "dgCMatrix"
#  │                              Xkr4 Gm1992 Gm37381 Rp1 Sox17
#  │AAAGGGCAGTTCATGC>SI-GA-H8 1.997294      .       .   .     .
#  │AACAACCAGGAAGTAG>SI-GA-H8 1.543411      .       .   .     .
#  │AACCATGTCTTCGATT>SI-GA-H8 2.203357      .       .   .     .
#  │AACCTTTAGAATTGTG>SI-GA-H8 2.509481      .       .   .     .
#  │AAGACAAGTTCAAGGG>SI-GA-H8 2.491706      .       .   .     .
```

4. Create a seurat object

```r
seurat <- CreateSeuratObject(counts=ad$X)
seurat
# │An object of class Seurat
# │3305 features across 25069 samples within 1 assay
# │Active assay: RNA (3305 features, 0 variable features)
```


