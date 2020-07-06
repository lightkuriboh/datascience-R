# Q1 
data_file <- 'data/getdata_data_w3q1.csv'
my_data <- read.csv(data_file)
str(my_data)
agricultureLogical <- my_data$ACR == 3 & my_data$AGS == 6
which(agricultureLogical)

# Q2
img <- readJPEG('data/getdata_jeff.jpg', native = T)
img
quantile(img, probs = 0.8)

# Q3
data_file_2 <- 'data/getdata_data_GDP_w3q3.csv'
my_data_2 <- read.csv(data_file_2)
data_file_3 <- 'data/getdata_data_EDSTATS_Country_w3q3.csv'
my_data_3 <- read.csv(data_file_3)
str(my_data_2)
str(my_data_3)
head(my_data_2, 10)
head(my_data_3)
names(my_data_2)
names(my_data_3)

merged <- merge(my_data_2, my_data_3, by.x = 'X', by.y = 'CountryCode', all = F)
class(merged[1, 'Gross.domestic.product.2012'])
merged[, 'Gross.domestic.product.2012'] <- as.numeric(as.character(merged[, 'Gross.domestic.product.2012']))
merged <- arrange(merged, desc(Gross.domestic.product.2012))

head(merged[1:10], 6)
tail(merged, 6)
length(merged$X[!is.na(merged$X)])
merged[13, 'X.2']


tapply(merged$Gross.domestic.product.2012, merged$Income.Group, mean, na.rm = T)
?tapply


merged_by_group <- merged %>% melt(id = c('Gross.domestic.product.2012'), measure.vars = c('Income.Group'))
head(merged_by_group)
dim(merged_by_group)
sum(merged_by_group[1:38, 'value'] == 'Lower middle income')
?group_by
?melt
