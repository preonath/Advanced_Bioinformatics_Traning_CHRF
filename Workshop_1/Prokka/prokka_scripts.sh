#!/bin/bash

# Take user input for fasta file and output folder name

read -e -p "Insert Assembly Fasta File name : " fasta_file
read -e -p "Insert Prokka Output Folder Name: " prokka_result
read -e -p "Insert Sequence ID Name : " sequence_id



echo "Prokka Starting"

prokka --outdir $prokka_result --cpus 100 --gcode 11 --prefix $sequence_id --locustag $sequence_id --quiet $fasta_file --force

echo "Prokka Complete"

