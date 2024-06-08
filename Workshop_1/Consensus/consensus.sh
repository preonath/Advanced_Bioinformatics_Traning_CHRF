echo "# Generate consensus seq"
cp final_variants.vcf final_variants.phageD.vcf
bgzip --threads 12 final_variants.phageD.vcf
bcftools index --threads 12 final_variants.phageD.vcf.gz
bcftools consensus -f $ref final_variants.phageD.vcf.gz > final.consensus.fasta
