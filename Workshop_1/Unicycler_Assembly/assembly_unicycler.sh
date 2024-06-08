rawpath="/home/asus/Desktop/CHRF_Project/Bioinformatics_Traning/Advance_Bioinformatics_Traning/Data"

# out_dir="/media/chrf/GenomeBack/SPN/All_Batchs_SPN"


for files in $rawpath\/*
do
	name=`basename $files| cut -f 1,2 -d '_'`

	echo $name
	mkdir -p -v $rawpath\/$name\/1_RawData
	#
	mv $rawpath\/$name*\_R1_001.fastq.gz $rawpath\/$name*\_R2_001.fastq.gz $rawpath\/$name\/1_RawData/
	unicycler -1 $rawpath\/$name\/1_RawData\/$name*\_R1*.fastq.gz -2 $rawpath\/$name\/1_RawData\/$name*\_R2*.fastq.gz --min_fasta_length 300 -t 85 --keep 1 -o $rawpath\/$name\/3_Unicycler/
	mv $rawpath\/$name\/3_Unicycler\/assembly.fasta $rawpath\/$name\/3_Unicycler\/$name\_contigs.fasta
	break

done


