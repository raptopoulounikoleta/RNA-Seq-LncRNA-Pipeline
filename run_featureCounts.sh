#!/bin/bash

# Create output directory
mkdir -p 03_counts

# Run featureCounts with lncRNA-optimized parameters:
# -M         : Count multi-mapping reads
# --fraction : Assign fractional counts to multi-mapping reads
# -O         : Count reads overlapping multiple features
featureCounts -T 8 \
  -M \
  --fraction \
  -O \
  -a reference_genome/Homo_sapiens.GRCh38.112.gtf \
  -o 03_counts/gene_counts_lncRNA.txt \
  02_alignment/*_Aligned.sortedByCoord.out.bam
