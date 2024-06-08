#***********************************************#
#		Mapping by bowtie2		                #
#***********************************************#



rawpath="/home/asus/Desktop/CHRF_Project/Bioinformatics_Traning/Advance_Bioinformatics_Traning/Data"



Ref_SPN='/home/asus/Desktop/CHRF_Project/Bioinformatics_Traning/Advance_Bioinformatics_Traning/Mapping/Ref_SPN'
refname=NZ_CP035252_SPN
ref=/home/asus/Desktop/CHRF_Project/Bioinformatics_Traning/Advance_Bioinformatics_Traning/Mapping/Ref_SPN/NZ_CP035252_SPN.fa



# Build Index (speed up the alignment)
mkdir $Ref_SPN\/Index/
bowtie2-build $Ref_SPN\/$ref $Ref_SPN\/Index/index
Index=$Ref_SPN/Index/



for files in $rawpath\/*
do
	name=`basename $files| cut -f 1,2 -d '_'`
	echo $name
	
	mkdir -p -v $rawpath\/$name\/5_Mapping

	fastq_1=$rawpath/$name/1_RawData/$name*\_R1_001.fastq.gz
	fastq_2=$rawpath/$name/1_RawData/$name*\_R2_001.fastq.gz
	# echo $fastq_1
	# echo $fastq_2


	echo "# Mapping the reads"
	bowtie2 -x $Index\/index -1 $fastq_1 -2 $fastq_2 -S $rawpath\/$name\/5_Mapping/$name\.sam -p 12

	echo "# Convert .sam to .bam"
	samtools view -ubS --threads 12 $rawpath\/$name\/5_Mapping/$name\.sam > $rawpath\/$name\/5_Mapping/$name\.bam

	echo "# Sort the .bam"
	samtools sort --threads 12 $rawpath\/$name\/5_Mapping/$name\.bam -o $rawpath\/$name\/5_Mapping/$name\.sorted.bam
	
	echo "# Index sorted BAM alignments"
	samtools index -@ 72 $rawpath\/$name\/5_Mapping/$name\.sorted.bam
	
	
	echo "# Call SNPs and Indels"
	bcftools mpileup -d 1000 -Q 20 -Ou -Bf $ref $rawpath\/$name\/5_Mapping/$name\.sorted.bam | bcftools call -cv --threads 72 | bcftools view -v snps -g hom --threads 72 > $rawpath\/$name\/5_Mapping/$name\.raw.vcf


done


