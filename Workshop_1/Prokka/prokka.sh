rawpath="/home/asus/Desktop/CHRF_Project/Bioinformatics_Traning/Advance_Bioinformatics_Traning/Data"

# out_dir="/media/chrf/GenomeBack/SPN/All_Batchs_SPN"


for files in $rawpath\/*
do
	name=`basename $files| cut -f 1,2 -d '_'`
	echo $name
	
	echo "Prokka Annotation is Starting for ${name}.........."
	
	# mkdir -p -v $rawpath\/$name\/4_Prokka
	# prokka --outdir $rawpath\/$name\/4_Prokka/prokka --cpus 90 --gcode 11 --prefix $name --locustag $name --quiet $rawpath\/$name\/3_Unicycler\/$name\_contigs.fasta --force
	cp $rawpath\/$name\/4_Prokka/prokka/$name\.faa $rawpath\/$name\/4_Prokka/$name\.faa
	cp $rawpath\/$name\/4_Prokka/prokka/$name\.ffn $rawpath\/$name\/4_Prokka/$name\.ffn
	cp $rawpath\/$name\/4_Prokka/prokka/$name\.gff $rawpath\/$name\/4_Prokka/$name\.gff
	echo "${name} - Prokka Annotation Done"

done


# 	perl $script\/seq_length.pl $dir\/4_Annotation/$name\.faa $dir\/4_Annotation/$name\.faa.len
# 	perl $script\/seq_length.pl $dir\/4_Annotation/$name\.ffn $dir\/4_Annotation/$name\.ffn.len
# 	echo "Gzip everything in the Prokka folder"
# 	gzip $dir\/4_Annotation/prokka/*
# 	echo $name" - Prokka Annotation Done"
# 	)
# done


