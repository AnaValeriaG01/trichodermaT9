# Comparative Genomic Analysis of Trichoderma harzianum T9

## Background

The search for biological alternatives to promote sustainable agriculture and reduce pesticide use is becoming increasingly urgent, especially in the face of growing challenges posed by climate change. Microorganisms from extreme environments hold remarkable potential as biocontrol agents, thanks to their unique adaptations that allow them to survive under harsh conditions such as high temperatures, salinity, and limited water availability.

Trichoderma species are well known for their effectiveness as biocontrol agents. However, many strains perform poorly in extreme soils, for example, those with high salinity or alkaline pH. In this study, we focused on Trichoderma harzianum T9, an isolate obtained from the desertic and alkaline soils of Nuevo León, Mexico, which has shown exceptional resilience.

## Objective

This repository contains the data, scripts, and results for the bioinformatic analyses performed to characterize genetic variants in T9 and compare them with other strains from the harzianum clade.

## Methodology

### Sequence Alignment & Variant Calling
Clean sequencing reads from T9 were mapped against the reference genomes of *T. harzianum* (M10, T22, Th0179, Th3844, TR274), *T. afroharzianum* (Th6), and *T. atroviride* (IMI206040) using the BWA-MEM algorithm (Li, 2013). The resulting alignments were processed with SAMtools and BCFtools (Li et al., 2009) to sort and index the files, as well as to identify single nucleotide polymorphisms (SNPs). Variants were then filtered with VCFtools (Danecek et al., 2011) to retain high-confidence calls and generate precise variant position files.  
[🔶 script 01](https://github.com/AnaValeriaG01/trichodermaT9/blob/main/scripts/01_Pipeline.sh)

### Variant Normalization & Outlier Detection
To account for gene size and relative abundance, SNP counts per gene were normalized in R using the **dplyr** and **tidyverse** packages.  
[🔶 script 02](https://github.com/AnaValeriaG01/trichodermaT9/blob/main/scripts/02_SNPs_T9_normtext.rmd)  

Outlier detection was performed through boxplot analysis in **ggplot2**, with *T. atroviride* serving as the baseline control for defining thresholds of natural variation.  
[🔶 script 03](https://github.com/AnaValeriaG01/trichodermaT9/blob/main/scripts/03_boxplot_outliers_color.R)  
[🔶 script 04](https://github.com/AnaValeriaG01/trichodermaT9/blob/main/scripts/04_dotplots-labels-outliers.R)

### Orthology & Functional Annotation
Orthologous gene groups were determined using OrthoFinder (Emms & Kelly, 2019), enabling comparison of variant locations within a broader evolutionary framework.  
[🔶 script 05](https://github.com/AnaValeriaG01/trichodermaT9/blob/main/scripts/05_T9_ortho_find.Rmd)  

Functional annotation of these orthogroups was carried out using eggNOG-mapper (Cantalapiedra et al., 2021), and association between orthologues and their annotation in T9 was performed to identify biological patterns of high relevance.  
[🔶 script 06](https://github.com/AnaValeriaG01/trichodermaT9/blob/main/scripts/06_correlate-ortho-functann.R)

### Full Package
If preferred, all scripts can be downloaded as a compressed package:  
[📦 Download scripts.zip](https://github.com/AnaValeriaG01/trichodermaT9/blob/main/scripts/scripts.zip)
