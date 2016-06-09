chrN = c('chr1', 'chr2', 'chr3', 'chr4', 'chr5', 'chr6', 'chr7', 'chr8', 'chr9', 'chr10',
         'chr11', 'chr12', 'chr13', 'chr14', 'chr15', 'chr16', 'chr17', 'chr18', 'chr19',
         'chrX', 'chrY')

for (chr in chrN) {
  filename = paste('../partitions/', chr, '/partitions_no_penalty.Rda', sep = '')
  partitions <- readRDS(file = filename)
  
  filename <- paste('../graphics/inverse_cumulative/', chr, '.png', sep = '')
  png(filename = filename)
  title <- paste('Inverse cumulative function,', chr)
  r <- ecdf(partitions$res1 - partitions$res2)
  curve(100 * (1 - r(x)), from=0, to=4, 
        main=title, xlab = 'Cuttof values', ylab = 'Percentage of circadian blocks')
  abline(h=40)
  dev.off()
  
}