# compStrings: Analysing algorithmically compressed strings

#### Scripts for: Through the compression glass: language complexity and the structure of algorithmically compressed strings (version 1.0)

### DOI

[![DOI](https://zenodo.org/badge/299907289.svg)](https://zenodo.org/badge/latestdoi/299907289)

https://zenodo.org/badge/latestdoi/299907289

### Description

This repository provides scripts and instructions for the retrieval and processing of gzip’s debugging output which is analysed in the related publication

tba

Against the background of the sociolinguistic-typological debate on language complexity which is all about measuring and explaining variability in language complexity, the publication presents an in-depth analysis of algorithmically compressed texts. Specifically, the formal and linguistic structure of compressed text sequences as retrieved from *gzip*’s debugging output (or lexicon) are examined. Compression algorithms like *gzip* are sometimes employed to approximate language complexity via the information-content, or complexity, in texts. The publication focuses on the compression technique, an information-theoretic measure based on Kolmogorov complexity. Scripts for the implementation of the technique are available [here](https://github.com/katehret/measuring-language-complexity).

All scripts were tested on Debian GNU/Linux 9. Additionally, the following open source programs were used: [R](https://www.r-project.org/), version 3.6.3 (2020-02-29), and [gzip](https://www.gzip.org/), version 1.6.


### Overview and description of files

This repository contains the following resources (in alphabetical order):

* debugout_analysis.r

An R file listing the commands to format and process gzip’s debugging output. Specifically, commands are provided to extract the complete lexicon entries, the distance to the previous identical sequence length and frequency of compressed strings, as well as commands for some basic distributional analyses. The file requires debugout_functions.r

* debugout_functions.r

An R file containing custom-made functions for formatting and processing *gzip*’s debugging output. The file needs to be stored in the same directory as the file debugout_analysis.r. 

* makedebug.sh

A shell script which calls *gzip*’s debug version (*dgzip*) and the commands for lexicon retrieval (see below).


### How to build *gzip*’s debug version

To build the debugging version of *gzip* and save it as a separate program (*dgzip*) use the following shell commands:

    apt-get source gzip
    cd gzip-*
    ./configure
    make --debug > dgzip

### How to retrieve the lexicon

In order to retrieve the debug output (or lexicon of compressed strings), *gzip* is used to first compress a given input text which is then piped to the debug version *dgzip* with a call for verbose decompression:

    gzip -f < input.txt | dgzip -d -v -v -f 

The lexicon can be retrieved and saved using makedebug.sh: 

    makedebug.sh input.txt > output.txt

! NOTE: For replication of the analysis presented in the related publication, the input text should be pre-processed as follows. All punctuation, additional whitespace, UTF-8 characters or similar should be removed. The input text should be converted to lowercase. Different formatting might result in differences in frequency and length of compressed strings. 

