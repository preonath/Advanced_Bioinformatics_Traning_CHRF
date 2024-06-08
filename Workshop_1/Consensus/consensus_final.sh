analysis_directory_path="/home/preonath/Desktop/Data/Consensus_genome/"
ref_seq_path="/home/preonath/Desktop/Data/Reference_Sequence/TPRV"
mkdir -p -v $analysis_directory_path/Analysis 
script_python="/home/preonath/Desktop/CHRF_Project/Consensus_Genome/local_analysis"




for dir in $analysis_directory_path/Assembly/*; do
	# bcftools view --threads 80 -g hom $analysis_directory_path/Analysis\/$name\/1_SAM/$name\.raw.vcf > $analysis_directory_path/Analysis\/$name\/1_SAM/$name\.hom.vcf
	# python $script_python\/Filter_SNP_quality_for_phylo.py --vcf $analysis_directory_path/Analysis\/$name\/1_SAM/$name\.hom.vcf --output $analysis_directory_path/Analysis\/$name\/1_SAM/$name\.phrd.vcf
	# echo "# Filter for biases"
	# vcfutils.pl varFilter -1 0.001 -3 0.001 -4 0.001 $analysis_directory_path/Analysis\/$name\/1_SAM/$name\.phrd.vcf > $analysis_directory_path/Analysis\/$name\/1_SAM/$name\.biasF.vcf
	# Create consensus
	# cp $analysis_directory_path/Analysis\/$name\/1_SAM/$name\.phrd.vcf $analysis_directory_path/Analysis\/$name\/1_SAM/$name\.phrd_1.vcf
	# bgzip --threads 80 $analysis_directory_path/Analysis\/$name\/1_SAM/$name\.phrd_1.vcf
	# bcftools index --threads 80 $analysis_directory_path/Analysis\/$name\/1_SAM/$name\.phrd_1.vcf.gz
	# bcftools consensus -f $ref_seq_path/KM390024.1.fasta $analysis_directory_path/Analysis\/$name\/1_SAM/$name\.phrd_1.vcf.gz > $analysis_directory_path/Analysis\/$name\/1_SAM/$name\.consensus.fasta
	# sed -i "1 s/.*/>$name/" $analysis_directory_path/Analysis\/$name\/1_SAM/$name\.consensus.fasta
	# perl -pe '/^>/ ? print "\n" : chomp' $analysis_directory_path/Analysis\/$name\/1_SAM/$name\.consensus.fasta > $analysis_directory_path/Analysis\/$name\/1_SAM/$name\.consensus1.tmp
	# grep . $analysis_directory_path/Analysis\/$name\/1_SAM/$name\.consensus1.tmp > $analysis_directory_path/Analysis\/$name\/1_SAM/$name\.consensus.fasta
	# rm $analysis_directory_path/Analysis\/$name\/1_SAM/$name\.consensus1.tmp 
done
# cat $analysis_directory_path/Analysis\/$name\/1_SAM/*.consensus.fasta ./All