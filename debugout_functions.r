####R functions for the formatting and basic analysis of gzip's lexicon output
####as presented in the related publication Ehret, Katharina (submitted)
####"Through the compression glass: language complexity and the structure of
####algorithmically compressed strings". Submitted to X.


clean.debugout = function(x){
	e = strsplit(x, "\n")
	gsub("\\\\", "", e)
}


format.debugout = function(debugout){

	pattern = "(^\\[([0-9]+),([0-9]+)\\])?(.*)"
	hits =  regexec(pattern, debugout)
	matches = regmatches(debugout, hits) 

	results <- data.frame(do.call(rbind, matches))
        colnames(results) <- c("fullentry", "lengthdistance","distance", "length", "text")

	return(results)
}


extract.compressedstrings = function(results){

	splitstrings = strsplit(unlist(as.character(results$text)), "") #create list of splitted strings
	stringlens = as.vector(results$length)
	s = substr(results$text, start=1, stop=as.vector(results$length))

	return(s)
}


get.stringdistribution <- function(strings){

	f = as.numeric(table(strings))
	t =  table(f)
	d = data.frame(number_uniquestrings = as.vector(t), frequency=as.numeric(names(t)))
	d = d[order(-d$frequency),]
	return(d)
}

get.lengthdistribution <- function(length){

	strings = as.numeric(table(length))
	len = names(table(length))
	d = data.frame(length =	as.vector(len), number_strings = strings)
	return(d)

}


