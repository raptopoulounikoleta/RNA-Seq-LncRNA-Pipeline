# RNA-Seq Pipeline for Coding and lncRNA Expression Analysis

This repository contains the Bash scripts used for the upstream RNA-Seq analysis pipeline of my Master's Thesis at the Democritus University of Thrace. 

## Pipeline Steps
1. **Quality Control:** Initial evaluation of raw reads.
2. **Read Trimming (`run_fastp.sh`):** Adapter removal and quality filtering using `fastp`.
3. **Alignment (`run_star.sh`):** Mapping clean reads to the human reference genome (GRCh38) using `STAR`.
4. **Read Counting:** Quantifying gene expression levels using `featureCounts`.

*Note: Raw data, BAM files, and reference genomes are stored locally on the university server and are intentionally excluded from this repository.*
