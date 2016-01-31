
# Create filenames

filename <- function(n) {
    if(n %/% 10 == 0) {
        name <- paste("00", n, sep = "")     
    } else {
        if(n %/% 10 <= 9) {
            name <- paste("0", n, sep = "")     
        } else {
            name <- n
        }
    }
    
    paste(name, ".csv", sep = "")
}  
  


#-------------------------------------------------------------------------------------------

# Part 1

pollutantmean <- function(directory, pollutant, id = 1:332) {
  sums <- c()
  sizes <- c()
  for(i in 1:length(id)) {
    df <- NULL
    path <- paste("C:\\Users\\Lenovo\\Desktop", directory, filename(id[i]), sep = "\\")
    df <- read.csv(path)
    sums[i] <- sum(df[, pollutant], na.rm = TRUE)
    sizes[i] <- length(as.numeric(df[, pollutant])[!is.na(df[, pollutant])])
  }
  return(sum(sums) / sum(sizes))
}

#-------------------------------------------------------------------------------------------

# Part 2

complete <- function(directory, id = 1:332) {
  nobs <- c()
  for(i in 1:length(id)) {
    df <- NULL
    path <- paste("C:\\Users\\Lenovo\\Desktop", directory, filename(id[i]), sep = "\\")
    df <- read.csv(path)
    nobs[i] <- length(as.numeric(df$sulfate)[!is.na(df$sulfate) & !is.na(df$nitrate)])
  }
  return(data.frame(cbind(id, nobs)))
}

dd <- complete("specdata", 3)

#-------------------------------------------------------------------------------------------

# Part 3

corr <- function(directory, threshold = 0) {
  df <- complete(directory)
  new_ids <- as.numeric(df$id[df$nobs > threshold])
  corrs <- c()
  if (length(new_ids) == 0) {
    return(corrs)
  }
  for(i in 1:length(new_ids)) {
    df <- NULL
    path <- paste("C:\\Users\\Lenovo\\Desktop", directory, filename(new_ids[i]), sep = "\\")
    df <- read.csv(path)
    x <- as.numeric(df$sulfate)[!is.na(df$sulfate) & !is.na(df$nitrate)]
    y <- as.numeric(df$nitrate)[!is.na(df$sulfate) & !is.na(df$nitrate)]
    corrs[i] <- cor(x, y)
  }
  return(corrs)
}