all: report.html

clean:
				rm -f words.txt histogram.tsv histogram.png report.html

words.txt:
				Rscript -e 'download.file("https://svnweb.freebsd.org/base/head/share/dict/web2?view=co", destfile = "words.txt", quiet = TRUE)'

histogram.tsv: R/histogram.r words.txt
				Rscript $<

histogram.png: histogram.tsv
			Rscript -e 'library(ggplot2); qplot(Length, Freq, data = read.delim("$<")); ggsave("histogram.png")'
			rm -f Rplots.pdf

report.html: report.rmd
			Rscript -e 'rmarkdown::render("$<")'
