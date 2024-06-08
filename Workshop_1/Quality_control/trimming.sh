rawpath="/home/asus/Desktop/CHRF_Project/Bioinformatics_Traning/Advance_Bioinformatics_Traning/Data"
adapters_path="/home/asus/Desktop/CHRF_Project/Bioinformatics_Traning/Advance_Bioinformatics_Traning/Quality_control/adapter"


for files in $rawpath/*
do
	name=`basename $files | cut -f 1,2 -d '_'`
	echo $name


	fastq_1=$rawpath/$name/1_RawData/$name*\_R1_001.fastq.gz
	fastq_2=$rawpath/$name/1_RawData/$name*\_R2_001.fastq.gz
	# echo $fastq_1
	# echo $fastq_2


	mkdir -p -v $rawpath\/$name\/2_PreProcess/2_Trimmomatic/
	R1_Trim_P=$rawpath\/$name\/2_PreProcess/2_Trimmomatic/$name\_R1_TrmP.fastq.gz
	R2_Trim_P=$rawpath\/$name\/2_PreProcess/2_Trimmomatic/$name\_R2_TrmP.fastq.gz

	R1_Trim_S=$rawpath\/$name\/2_PreProcess/2_Trimmomatic/$name\_R1_TrmS.fastq.gz
	R2_Trim_S=$rawpath\/$name\/2_PreProcess/2_Trimmomatic/$name\_R2_TrmS.fastq.gz


	trimmomatic PE -threads 92 $fastq_1 $fastq_2 $R1_Trim_P $R1_Trim_S $R2_Trim_P $R2_Trim_S ILLUMINACLIP:$adapters_path/TruSeq3-PE-2.fa:2:30:10 SLIDINGWINDOW:4:20 MINLEN:36 LEADING:20 TRAILING:20
	#unicycler -1 $R1_Trim_P -2 $R2_Trim_P -o $dir\/3_Unicycler/ -t 92 --min_fasta_length 200 --keep 1
done



