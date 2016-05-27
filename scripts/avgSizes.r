chrN = c('chr1', 'chrX', 'chrY')
sigmas = c(0, 0.05, 0.1, 0.13, 0.16, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1, 2, 5)

for (chr in chrN) {
  sizes = rep(0, length(sigmas))
  
  data <- list()
  sizes <- rep(0, length(sigmas))
  
  for(i in 1:length(sigmas)) {
    filename = paste('partitions/', chr, '/partitions_sigma_', sigmas[i], '.Rda', sep = '')
    partition <- readRDS(file = filename)
    
    name = paste('', sigmas[i], '', sep = '')
    
    data[[name]] <- partition$sizes
    sizes[i] <- mean(partition$sizes)
  }
  
  #plot the simple mean
  mainTitle = paste('Average size of partitions per sigma,', chr)
  plot(sigmas, sizes, main=mainTitle, xlab='Sigma values', ylab='Average sizes')
  lines(sigmas, sizes)
}