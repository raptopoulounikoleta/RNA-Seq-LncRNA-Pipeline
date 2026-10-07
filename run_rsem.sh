#!/bin/bash

# 1. Define directories and variables
BAM_DIR="02_alignment"
OUT_DIR="04_rsem"
INDEX="reference_genome/rsem_index/human_rsem"

# 2. Create the output directory if it doesn't already exist
mkdir -p "$OUT_DIR"

# 3. Iterate over all transcriptome-aligned BAM files
for bam in "$BAM_DIR"/*_Aligned.toTranscriptome.out.bam; do
    
    # Extract the base name to name our output files properly
    base=$(basename "$bam" _Aligned.toTranscriptome.out.bam)
    
    # Print status message
    echo "Starting RSEM quantification for sample: $base..."
    
    # 4. Run RSEM
    # -p 8: Use 8 CPU threads for faster processing
    # --bam: Specify that the input is a BAM file
    # --no-bam-output: Do not generate an additional BAM output to save disk space
    rsem-calculate-expression -p 8 \
                              --bam \
                              --no-bam-output \
                              "$bam" \
                              "$INDEX" \
                              "$OUT_DIR/${base}"
                              
    # Print completion message
    echo "Finished quantifying: $base"
    echo "-----------------------------------"
    
done
