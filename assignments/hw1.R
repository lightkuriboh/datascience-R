
myData <- read.csv('data/hw1_data.csv')
myData
myData[1]
isNA <- is.na(myData[[1]])
length(isNA[isNA == TRUE])
mean(myData[[1]][!isNA])

extracted1 <- myData$Ozone > 31
extracted2 <- myData$Temp > 90
extracted <- extracted1 & extracted2
newData <- myData$Solar.R[extracted]
removeNA <- newData[!is.na(newData)]
mean(removeNA)

month6 <- myData$Month == 5
month6Data <- myData$Ozone[month6]
month6Data
mean(month6Data[!is.na(month6Data)])

xxx <- 0:10
xxx
xxx[xxx %in% 0:5] <- 0
xxx
