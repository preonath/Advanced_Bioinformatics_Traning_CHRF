rawpath="/home/asus/Desktop/CHRF_Project/Bioinformatics_Traning/Advance_Bioinformatics_Traning/Data"


for files in $rawpath/*
do
	name=`basename $files | cut -f 1,2 -d '_'`
	echo $name



	assembly_contig=$rawpath/$name/3_Unicycler/$name\_contigs.fasta
	# echo $assembly_contig
	mkdir -p -v $rawpath\/$name\/6_mlst/
	mlst --legacy --scheme $assembly_contig > $rawpath\/$name\/6_mlst/$name\_mlst.csv

done
