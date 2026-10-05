#!/bin/bash

# ==============================================================================
# Script Name: run_fastp.sh
# Description: Automated quality control and adapter trimming using fastp.
# ==============================================================================

INPUT_DIR="raw_data"
OUT_DIR="01_qc"
REPORT_DIR="FastQC_Results"

mkdir -p "$OUT_DIR"
mkdir -p "$REPORT_DIR"

for file in "$INPUT_DIR"/*.fastq.gz; do
    
    base=$(basename "$file" .fastq.gz)
    
    # Run fastp with quality and length filters
    fastp -i "$file" \
          -o "$OUT_DIR/${base}_clean.fastq.gz" \
          -w 8 \
          --qualified_quality_phred 20 \
          --average_qual 20 \
          --length_required 36 \
          -h "$REPORT_DIR/${base}_fastp.html" \
          -j "$REPORT_DIR/${base}_fastp.json"
          
done
