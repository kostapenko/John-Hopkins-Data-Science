# Week 1

# Question 1:

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv",destfile = '1.csv')
        
df <- read.csv("1.csv")

data <- data.table(df)

dd1 <- (data[ , one := HINCP >= 1000000])
dd2 <- (data[ , two := FINCP >= 1000000, three := (VAL == 24)])
dd3 <- (data[ , three := (VAL == 24)])

dd2[ , .N, by = three]
View(df$FES)

----------------------------------------------------------------------------------

# Question 3:  
library(xlsx)

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
              , destfile = '2.xlsx')
df <- NULL
df <- read.xlsx("3.xlsx", sheetIndex = 1, header = T, startRow = 18, endRow = 23)

dat <- df[, c(7:15)]
dat

----------------------------------------------------------------------------------
  
  # Question 4:
library(XML)
fileURL <- "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
doc <- htmlTreeParse(fileURL, useInternalNodes = T)

s <- xpathSApply(doc, "//zipcode", xmlValue)
length(s[s == 21231])
----------------------------------------------------------------------------------
  
  # Question 5:
library(data.table)
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
             , destfile = '5.csv')
DT <- fread("5.csv")

pt <- proc.time()
sapply(split(DT$pwgtp15,DT$SEX),mean)
proc.time() - pt

system.time(tapply(DT$pwgtp15,DT$SEX,mean))
proc.time() - pt

system.time(rowMeans(DT)[DT$SEX==1])
system.time(rowMeans(DT)[DT$SEX==2])

system.time(mean(DT$pwgtp15,by=DT$SEX))
proc.time() - pt

system.time((mean(DT$pwgtp15,by=DT$SEX)))
proc.time() - pt

system.time(mean(DT[DT$SEX==1,]$pwgtp15))
system.time(mean(DT[DT$SEX==2,]$pwgtp15))

print("Azaza");
