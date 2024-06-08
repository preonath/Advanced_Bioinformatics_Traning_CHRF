#!/usr/bin/env python
#
# This code is adapted from Biostar Handbook
#
from __future__ import print_function, unicode_literals

import os, time
import re
import subprocess
import sys
from os.path import expanduser
from sys import platform

PY3 = True if (sys.version_info > (3, 0)) else False


def exists():
    return True


def regexp_check(pattern, text):
    return re.search(pattern, text, re.MULTILINE)


def more_recent(pattern, text):
    version = text.strip()
    return version >= pattern


# A list of tools to check.
TOOLS = [
    'bwa', 'fastqc -h','efetch', 'esearch', 'samtools', 'fastq-dump', 'bowtie2', 'bcftools',
    'trimmomatic', 'blastn -h', 'prokka', 'seqkit', 'bio', 'unicycler', 'mlst -h', 'raxml-ng',
    'run_resfinder.py -h', 'virulencefinder.py -h'
]

def bash_check():
    bashrc = expanduser("~/.bashrc")
    bashprofile = expanduser("~/.bash_profile")

def path_check():

    # The PATH variable
    paths = os.environ.get('PATH').split(':')
    bindir = expanduser("~/bin")

    #
    # We need ~/bin to be in the PATH
    #
    if bindir not in paths:
        print("#")
        print("# Warning: the ~/bin folder is not in your PATH!")
        print("#")


def tool_check(tools):

    print("# Checking symptoms ...")

    # Give the user time to read the message.
    time.sleep(1)

    errlist = []

    for cmd in tools:
        args = cmd.split()

        print("# {:13s}".format(cmd), end="")
        sys.stdout.flush()

        res = subprocess.run(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE, shell=True)

        code = res.returncode

        if code not in (0, 1, 255):
            print(" --> ERROR")
            errlist.append(cmd)
        else:
            print(" ... OK")

    return errlist


FIXME = """
#
#
# If you are feeling adventurous, you can try the following:
#
# Uninstalls everything.
bash uninstall.sh

# Installs everything again.
bash bioinfo_install.sh

# To know more details check following link: https://www.biostarhandbook.com/

"""


def fixme():
    print(FIXME)


def health_check():

    errors = tool_check(tools=TOOLS)

    if errors:
        words = ", ".join(errors)
        print("#")
        print("# Found some problems")
        print("#")
        print("# Unable to run: {}".format(words))
        print("#")
        print("# Did you activate the desired environment???.")
        print("#")
    else:
        print("# Congratulations. Your bioinformatics setup is ready!!!")

    path_check()

if __name__ == '__main__':
    if '--fixme' in sys.argv:
        fixme()
    else:
        print("# Checking Setup !!!")
        health_check()
