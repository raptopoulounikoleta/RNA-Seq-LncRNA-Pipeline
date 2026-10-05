#!/bin/bash

# ==============================================================================
# Script Name: run_star.sh
# Description: Automated RNA-Seq alignment pipeline using STAR.
#              Maps cleaned FASTQ files against the human reference genome (GRCh38).
# ==============================================================================

# 1. Define Directories
# Set paths for input, index, and output to ensure easy maintenance
INPUT_DIR="01_qc"
INDEX_DIR="reference_genome/index"
OUT_DIR="02_alignment"

# Create the output directory if it doesn't already exist
mkdir -p "$OUT_DIR"

echo "Starting STAR alignment pipeline..."
echo "================================================="

# 2. Iterate through all clean FASTQ files in the input directory
for file in "$INPUT_DIR"/*_clean.fastq.gz; do
    
    # Extract the base name of the sample 
    # (e.g., extracts "SRR3309256" from "01_qc/SRR3309256_clean.fastq.gz")
    base=$(basename "$file" _clean.fastq.gz)
    
    echo "Processing sample: $base"

    # 3. Execute STAR Alignment
    # Parameters used:
    # --runThreadN 8                      : Utilize 8 CPU cores to speed up the alignment process
    # --genomeDir "$INDEX_DIR"            : Path to the pre-generated STAR genome index
    # --readFilesIn "$file"               : The input FASTQ file to be aligned
    # --readFilesCommand zcat             : Decompress .gz files on the fly during alignment
    # --outFileNamePrefix "$OUT_DIR/..."  : Output directory and prefix for the generated files
    # --outSAMtype BAM SortedByCoordinate : Output directly to a coordinate-sorted BAM file 
    
    STAR --runThreadN 8 \
         --genomeDir "$INDEX_DIR" \
         --readFilesIn "$file" \
         --readFilesCommand zcat \
         --outFileNamePrefix "$OUT_DIR/${base}_" \
         --outSAMtype BAM SortedByCoordinate
         
    echo "Finished alignment for sample: $base"
    echo "-------------------------------------------------"
    
done

echo "All samples have been successfully aligned!"
