
#Take user input
read -e -p "Insert top variant file: " variantfile
read -e -p "Insert bd data list: " bd_data


# Set variable for reference
REF=NC_045512.2

# Create a directory for reference genome
mkdir -p refs data/bd_seq/ blast_results

# Create accessions file
rm -f accessions.txt; touch accessions.txt

echo "Step 1: Download Reference Genome"
echo
sleep 1s

# Download the reference genome
efetch -db nuccore -id ${REF} -format fasta > refs/${REF}.fa


echo "Step 2: Decompress database file"
echo
sleep 1s

# Decompress the database file
tar -xzvf data/all-bd-sequences.fasta.tar.gz -C data/

echo "Step 2: Extract the accession list"
echo
sleep 1s

# Extract accession list
for variant in $(cat $variantfile)
do

# Extract the accession unmber of top vairants.
# what if we use > instead of >>
grep -w $variant -m 1 $bd_data | cut -d ',' -f 1 >> accessions.txt

done

echo "Accession list is complete!"
echo
sleep 1s


echo "Step 3: Extract nucleotide sequence for each accession and BLAST"
echo
sleep 1s

# Extract sequence from database and perform blast
for accession in $(cat accessions.txt)
do

echo "Working on ID: ${accession}"
echo
sleep 1s

# Extract sequence from main database.
seqkit grep -p ${accession} data/all-bd-sequences.fasta > data/bd_seq/${accession}.fa

# Perform blast
blastn -subject refs/${REF}.fa -query data/bd_seq/${accession}.fa > blast_results/${accession}.blast.txt

done

# Check file permission and make executable file

echo
echo "Job Done!!"
echo
