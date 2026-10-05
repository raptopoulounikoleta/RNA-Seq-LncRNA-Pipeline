#!/bin/bash

# Create output directory for gene counts
mkdir -p 03_counts

# Run featureCounts for all aligned BAM files
featureCounts -T 8 \
  -a reference_genome/Homo_sapiens.GRCh38.112.gtf \
  -o 03_counts/gene_counts.txt \
  02_alignment/*_Aligned.sortedByCoord.out.bam
