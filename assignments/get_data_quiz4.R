
data_file <- 'data/getdata_data_w4q1.csv'
my_data <- read.csv(data_file)

?strsplit
strsplit(names(my_data), 'wgtp')[[123]]

data_file_2 <- 'data/getdata_data_GDP_w4q2.csv'
my_data_2 <- read.csv(data_file_2)
head(my_data_2)
library(stringr)
gdp <- str_replace_all(my_data_2[5:195, 'X.3'], ',', '')
gdp <- as.numeric(gdp)
gdp <- gdp[!is.na(gdp)]
head(gdp)
sum(gdp) / 190
length(gdp)
mean(gdp)


country_names <- my_data_2$X.2
my_data_2[grep('*United', country_names), 'X.2'
]


data_file_3 <- 'data/getdata_data_EDSTATS_Country_w4q4.csv'
my_data_3 <- read.csv(data_file_3)
head(my_data_3)
merged <- merge(my_data_2, my_data_3, by.x = 'X', by.y = 'CountryCode', all = F)
names(my_data_3)
sum(grepl('Fiscal year end: June', merged$Special.Notes))




install.packages('quantmode')
library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn)
head(sampleTimes)
weekdays(as.Date(sampleTimes))
sum(weekdays(as.Date(sampleTimes)) == 'Thứ hai' & year(as.Date(sampleTimes)) == '2012')
sum(year(as.Date(sampleTimes)) == '2012')
