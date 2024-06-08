rawpath="/home/asus/Desktop/CHRF_Project/Bioinformatics_Traning/Advance_Bioinformatics_Traning/Data"

for files in $rawpath\/*
do
	name=`basename $files| cut -f 1,2 -d '_'`
	echo $name
	mkdir -p -v $rawpath\/$name\/2_PreProcess/1_FastQC_preTrim/
	fastqc -o $rawpath\/$name\/2_PreProcess/1_FastQC_preTrim/ -f fastq -t 12 $rawpath\/$name\/1_RawData\/$name*\_R1*.fastq.gz $rawpath\/$name\/1_RawData\/$name*\_R2*.fastq.gz 
	
done



