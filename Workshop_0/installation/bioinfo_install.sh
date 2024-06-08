#
# Setting up linux/MacOSX for bioinformatics
#
# This script is an adaptation from original script of Biostar Handbook
# For more details visit: https://www.biostarhandbook.com/index.html
#


# Check that the script runs using bash
if [ -z "$BASH_VERSION" ]; then
	echo "#"
	echo "# This script must be run using the bash shell!"
	echo "#"
	exit 1
fi

# Bash strict mode.
set -ue

echo "#"
echo "# 1/10 Setting up necessary profiles..."
echo "#"


# Default environment name.
ENV=bioinfo

# Conda directory name.
DIR=~/miniconda3

# Select the download based on the platform.
if [ "$(uname)" == "Darwin" ]; then
	URL=https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-x86_64.sh
else
	URL=https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
fi

# Copy the bash environment setup file to home directory
cp necessary_files/bash_setup.sh ~/.bash_setup.sh

# Ensure that the .bashrc file exists.
touch ~/.bashrc

# Append to bashrc if necessary.
if ! grep -q ".bash_setup.sh" ~/.bashrc; then
	echo "" >> ~/.bashrc
	echo "source ~/.bash_setup.sh" >> ~/.bashrc
	echo "" >> ~/.bashrc
fi

# Ensure that the .bash_profile file exists.
touch ~/.bash_profile

# Append to .bash_profile if necessary.
if ! grep -q ".bashrc" ~/.bash_profile; then
	echo "" >> ~/.bash_profile
	echo "source ~/.bashrc" >> ~/.bash_profile
	echo "" >> ~/.bash_profile
fi

# Install conda if necessary.
if [ ! -d "$DIR" ]; then
	# Download the miniconda installer.
	echo "#"
	echo "# 2/10 Downloading miniconda.."
	echo "#"
	curl -s -L ${URL} > miniconda-installer.sh

	# Install miniconda.
	echo "#"
	echo "# 3/10 Installing conda.."
	echo "#"
	bash miniconda-installer.sh -b
	
	# Initialize bash.
	${DIR}/condabin/conda init bash

	# Update conda.
	echo "#"
	echo "# 4/10 Updating conda.."
	echo "#"
	${DIR}/condabin/conda update -q -y -n base conda

	# Activate conda bioconda channels.
	${DIR}/condabin/conda config -q --add channels bioconda
	${DIR}/condabin/conda config -q --add channels conda-forge

	# Install mamba
	echo "#"
	echo "# 5/10 Installing mamba.."
	echo "#"
	${DIR}/condabin/conda install mamba -q -n base -c conda-forge -y
fi

# Check that the conda environment exists
if [ ! -d "$DIR/envs/$ENV" ]; then
	echo "#"
	echo "# 6/10 Creating the bioinfo environment.."
	echo "#"
	${DIR}/condabin/conda create -n $ENV -y python=3.8
fi

# Install necessary bioinformatics software.
echo "#"
echo "# 7/10 Installing bioinformatics software..."
echo "#"
cat necessary_files/tools_list.txt | xargs ${DIR}/condabin/mamba install -q -n ${ENV} -y


# Check that the conda environment exists
if [ ! -d "$DIR/envs/resfinder" ]; then
	echo "#"
	echo "# Creating separate environment for ResFinder"
	echo "#"
	${DIR}/condabin/conda create -n resfinder -y
fi

# Install ResFinder and Virulencefinder
echo "#"
echo "# Installing ResFinder and Virulencefinder..."
echo "#"
${DIR}/condabin/mamba install -n resfinder resfinder virulencefinder -y


# Download the resfinder Databases
echo "#"
echo "# Downloading ResFinder databases.."
echo "#"


# Download Databases
git clone https://bitbucket.org/genomicepidemiology/resfinder_db/ ~/miniconda3/envs/resfinder/bin/db_resfinder
git clone https://bitbucket.org/genomicepidemiology/pointfinder_db/ ~/miniconda3/envs/resfinder/bin/db_pointfinder
git clone https://bitbucket.org/genomicepidemiology/disinfinder_db/ ~/miniconda3/envs/resfinder/bin/db_disinfinder



# Install the setup_check.py
mkdir -p ~/bin
cp necessary_files/setup_check.py ~/bin/setup_check.py
chmod +x ~/bin/setup_check.py

# Install the bio package.
echo "#"
echo "# 8/10 Installing the bio package.."
echo "#"
${DIR}/envs/${ENV}/bin/python -m pip install bio -q --upgrade


# Install the Entrez Direct and SRA toolkit
echo "#"
echo "# 9/10 Installing Entrez Direct.."
echo "#"
yes no | sh -c "$(curl -fsSL ftp://ftp.ncbi.nlm.nih.gov/entrez/entrezdirect/install-edirect.sh)" > /dev/null


set +eu
echo "#"
echo "# 10/10 Installing the SRA toolkit.."
echo "#"
cat necessary_files/sratools.sh | bash


# There is a "nagware" aspect to GNU parallel that interferes running it automatically.
# The commands below silences the warning by accepting the license.
echo 'will cite' | parallel --citation 1> /dev/null  2> /dev/null


# Installation completed.
echo "#"
echo "# Installation complete \!\!"
echo "#"
echo "# Restart the terminal or type: source ~/.bash_profile"
echo "#"
