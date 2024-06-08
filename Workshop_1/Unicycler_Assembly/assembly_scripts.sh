#!/bin/bash

# Take user input for read files and output folder
read -e -p "Insert read_1 fastq.gz file: " read_1
read -e -p "Insert read_2 fastq.gz file: " read_2
read -e -p "Insert a name of Assembly output folder: " assembly_output

# Create the output directory
mkdir -p "$assembly_output"

# Check if the output directory was created successfully
#if [ ! -d "$assembly_output" ]; then
#  echo "Error: Failed to create the output directory."
#  exit 1
#fi

echo "Assembly Starting"
unicycler -1 "$read_1" \
	-2 "$read_2" --min_fasta_length 300 \
	-t 100 --keep 1 \
	-o "$assembly_output"

echo "Assembly Complete"

