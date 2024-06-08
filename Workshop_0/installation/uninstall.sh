#
# Uninstalls conda and undoes changes made by install.sh
#
# It should be run only if no other customizations were made beyond what bioinfo_install.sh has applied.
#
set -ue
echo "#"
echo "# Removing all bioinformatics setting"
echo "#"

# Delete all files.
rm -rf ~/miniconda3 ~/minicond*.sh ~/.condarc ~/.conda ~/.parallel
mv -f ~/.bash_setup.sh ~/.bash_setup.sh.bak
echo "# Uninstalled. See ~/.bash_setup.sh.bak" > ~/.bash_setup.sh

echo "# Uninstall complete."
echo "# Restart Terminal."
echo "#"
