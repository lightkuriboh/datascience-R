# Q1
my_url <- 'https://api.github.com/users/jtleek/repos'
raw_json_data <- content(httr::GET(my_url))
json_data <- jsonlite::fromJSON(rjson::toJSON(raw_json_data))
class(json_data)
names(json_data)
json_data$created_at[json_data$name == 'datasharing']


# Q2
data_file <- 'data/getdata_data_ss06pid.csv'
acs <- read.table(data_file)
acs <- as.data.frame(acs)
library(sqldf)
sqldf('SELECT pwgtp1 FROM acs WHERE AGEP < 50')

my_url <- 'http://biostat.jhsph.edu/~jleek/contact.html'
html_data <- url(my_url)
lapply(readLines(html_data)[c(10, 20, 30, 100)], nchar)


# Q3
fwf_file <- 'data/getdata_w2q5.for'
df <- read.fwf(fwf_file, widths = c(10, rep(c(9, 4), 4)))
ncol(df)
head(df)
numeric_df <- df[5:nrow(df), 2:ncol(df)]
head(numeric_df)
str(numeric_df)
class(numeric_df[1, 1])
summary(numeric_df)
numeric_df[] <- lapply(numeric_df, function (my_col) {
    as.numeric(as.character(my_col))
})

head(numeric_df)
sort(colSums(numeric_df, na.rm = T))
