
A <- readLines(con <- file("words.txt"))
close(con)
B <- nchar(A)
C <- as.data.frame(table(B))
colnames(C) <- c("Length", "Freq")

write.table(C, "histogram.tsv", row.names = FALSE, sep = "\t")

