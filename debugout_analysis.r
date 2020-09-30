####R commands for the formatting and basic analysis of gzip's debug output
####as presented in the related publication Ehret, Katharina (submitted)
####"Through the compression glass: language complexity and the structure of
####algorithmically compressed strings". Submitted to X.

#load dependencies
source(debugout_functions.r)

####formatting and retrieval
#import gzip's debug output (lexicon)
data = readLines()

#format the debug output and retrieve lexicon entries
clean.data = clean.debugout(data)

results = format.debugout(clean.data)

#retrieve the compressed strings and save them to the results
strings = extract.compressedstrings(results)

results$strings = strings

#save lexicon entries as csv file
write.csv(results, "lexicon.csv", row.names=F)


####basic analysis of compressed strings
#load the lexicon entries in R
lex = read.csv("lexicon.csv")

#establish number and frequency of unique strings
distrib =  get.stringdistribution(lex$strings)

#establish number of compressed strings by their length (in characters including spaces)
lens = get.lengthdistribution(lex$length) 


