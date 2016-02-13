# Question 1

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(url, destfile = "1.csv")

df1 <- read.csv(file = "1.csv")

splitnames <- strsplit(names(df1), "\\wgtp")
splitnames[[123]]

#---------------------------------------------------------------------------------------------------

# Question 2

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
download.file(url, destfile = "2.csv")

df2 <- read.csv(file = "2.csv")
names(df2) <- gsub("\\.", "", names(df2), )
names(df2)
df2$X3

vals <- df2[grepl("[0-9]", df2$X3), "X3"] 
vals <- gsub("\\,", "", vals, )
mean(as.numeric(vals[1:190]))

#---------------------------------------------------------------------------------------------------

# Question 3

names(df2)[names(df2) == "X2"] <- "countryNames"

grep("^United", df2$countryNames)

#---------------------------------------------------------------------------------------------------

# Question 4
url1 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
download.file(url1, destfile = "41.csv")

url2 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(url2, destfile = "42.csv")


df41 <- read.csv(file = "41.csv")
names(df41) <- gsub("\\.", "", names(df41), )
names(df41)
df41$Grossdomesticproduct2012
df41$Grossdomesticproduct2012 <- as.character(df41$Grossdomesticproduct2012)
df41$Grossdomesticproduct2012 <- as.numeric(df41$Grossdomesticproduct2012)

df41 <- df41[!is.na(df41$Grossdomesticproduct2012), ]

df42 <- read.csv(file = "42.csv")

names(df41)[names(df41) == "X"] <- "CountryCode"
df4 <- merge(df41, df42, by = "CountryCode")
length(grep("^Fiscal year end: June", df4$Special.Notes))
#length(grep("June", df4$Special.Notes))
#View(df4[grep("June", df4$Special.Notes), "Special.Notes"])

#---------------------------------------------------------------------------------------------------

# Question 5

library(quantmod)
amzn <- getSymbols("AMZN",auto.assign = FALSE)
sampleTimes <- index(amzn)
chars <- as.character(sampleTimes)
years <- substr(chars, start = 1, stop = 4)
length(years[years == "2012"])
