# echo "Go to wanted location for resfinder"
# cd /home/chrf/Desktop/CHRF_Project/home/chrf/Desktop/CHRF_Project

# echo "Clone the latest version and enter the resfinder directory"
# git clone https://git@bitbucket.org/genomicepidemiology/resfinder.git
# cd resfinder




# pip3 install tabulate biopython cgecore gitpython python-dateutil





# #echo "https://bitbucket.org/astanin/python-tabulate
# #echo "https://biopython.org
# #echo "https://bitbucket.org/genomicepidemiology/cge_core_module
# #echo "https://gitpython.readthedocs.io/en/stable/index.html





# #echo "ftp://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/LATEST/





# echo "Go to the directoy in which you installed the ResFinder tool"
# cd /home/chrf/Desktop/CHRF_Project/home/chrf/Desktop/CHRF_Project/resfinder
# cd cge
# git clone https://bitbucket.org/genomicepidemiology/kma.git
# cd kma && make






# echo "Go to the directoy in which you installed the ResFinder tool"
# cd /home/chrf/Desktop/CHRF_Project/resfinder
# git clone https://git@bitbucket.org/genomicepidemiology/resfinder_db.git db_resfinder


# echo "Go to the directoy in which you installed the ResFinder tool"
# cd /home/chrf/Desktop/CHRF_Project/resfinder
# git clone https://git@bitbucket.org/genomicepidemiology/pointfinder_db.git db_pointfinder



# echo "Go to the database directory"
# cd /home/chrf/Desktop/CHRF_Project/resfinder/db_resfinder
# python3 INSTALL.py


echo "Go to the resfinder database directory"
cd /home/preonath/Desktop/CHRF_Project/resfinder/db_resfinder
echo "create indexing directory"
mkdir -p -v kma_indexing
echo "Index files using kma_index"
kma_index -i db_resfinder/fusidicacid.fsa -o db_resfinder/kma_indexing/fusidicacid
kma_index -i db_resfinder/phenicol.fsa -o db_resfinder/kma_indexing/phenicol
kma_index -i db_resfinder/glycopeptide.fsa -o db_resfinder/kma_indexing/glycopeptide
kma_index -i db_resfinder/trimethoprim.fsa -o db_resfinder/kma_indexing/trimethoprim
kma_index -i db_resfinder/oxazolidinone.fsa -o db_resfinder/kma_indexing/oxazolidinone
kma_index -i db_resfinder/tetracycline.fsa -o db_resfinder/kma_indexing/tetracycline
kma_index -i db_resfinder/quinolone.fsa -o db_resfinder/kma_indexing/quinolone
kma_index -i db_resfinder/nitroimidazole.fsa -o db_resfinder/kma_indexing/nitroimidazole
kma_index -i db_resfinder/fosfomycin.fsa -o db_resfinder/kma_indexing/fosfomycin
kma_index -i db_resfinder/aminoglycoside.fsa -o db_resfinder/kma_indexing/aminoglycoside
kma_index -i db_resfinder/macrolide.fsa -o db_resfinder/kma_indexing/macrolide
kma_index -i db_resfinder/sulphonamide.fsa -o db_resfinder/kma_indexing/sulphonamide
kma_index -i db_resfinder/rifampicin.fsa -o db_resfinder/kma_indexing/rifampicin
kma_index -i db_resfinder/colistin.fsa -o db_resfinder/kma_indexing/colistin
kma_index -i db_resfinder/beta-lactam.fsa -o db_resfinder/kma_indexing/beta-lactam
echo "Go to the pointfinder database directory"
cd /home/preonath/Desktop/CHRF_Project/resfinder/db_pointfinder
echo "Index files using kma_index"
kma_index -i db_pointfinder/campylobacter/*.fsa -o db_pointfinder/campylobacter/campylobacter
kma_index -i db_pointfinder/escherichia_coli/*.fsa -o db_pointfinder/escherichia_coli/escherichia_coli
kma_index -i db_pointfinder/enterococcus_faecalis/*.fsa -o db_pointfinder/enterococcus_faecalis/enterococcus_faecalis
kma_index -i db_pointfinder/enterococcus_faecium/*.fsa -o db_pointfinder/enterococcus_faecium/enterococcus_faecium
kma_index -i db_pointfinder/neisseria_gonorrhoeae/*.fsa -o db_pointfinder/neisseria_gonorrhoeae/neisseria_gonorrhoeae
kma_index -i db_pointfinder/salmonella/*.fsa -o db_pointfinder/salmonella/salmonella
kma_index -i db_pointfinder/mycobacterium_tuberculosis/*.fsa -o db_pointfinder/mycobacterium_tuberculosis/mycobacterium_tuberculosis

