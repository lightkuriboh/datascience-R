RNGversion("3.5.1")  
set.seed(42)

get_file_name <- function (my_file_id) {
    file_id <- as.character(my_file_id)
    while (nchar(file_id) < 3) {
      file_id <- paste('0', file_id, sep = '')
    }
    file_id
}

get_data_from_file <- function (directory, file_id) {
    data_path <- paste(directory, '/', get_file_name(file_id), '.csv', sep = '')
    my_data <- read.csv(data_path)
    my_data
}

pollutantmean <- function (directory, pollutant, id=1:332) {
    sum_value <- 0
    total_count <- 0
    for (my_file_id in id) {
        
        my_data <- get_data_from_file(directory, my_file_id)
        
        non_na <- my_data[pollutant][!is.na(my_data[pollutant])]
        
        sum_value <- sum_value + sum(non_na)
        # total_count <- length(my_data[pollutant])
        total_count <- total_count + length(non_na)
    }
    sum_value / total_count
}

# pollutantmean("data/specdata", "nitrate")


complete <- function (directory, id = 1:332) {
    nobs <- vector(mode="numeric", length=length(id))
    for (i in 1:length(id)) {
        my_file_id <- id[i]
        
        my_data <- get_data_from_file(directory, my_file_id)
        
        nobs[i] <- length(
            my_data$ID[
                !is.na(my_data$sulfate) & !is.na(my_data$nitrate)
            ]
        )
    }
    
    data.frame(id = id, nobs = nobs)
}

# complete("data/specdata", 54)

corr <- function (directory, threshold = 0) {
    completed <- complete (directory, 1:332)
    
    answer <- vector(mode = 'numeric', length = 0)
    
    process_row <- function (id) {
        my_data <- get_data_from_file(directory, id)

        filter <- !is.na(my_data$sulfate) & !is.na(my_data$nitrate)

        sulfate <- my_data$sulfate[filter]
        nitrate <- my_data$nitrate[filter]

        cor(sulfate, nitrate)
    }
    
    add_to_answer <- function (row) {
        if (row['nobs'] > threshold) {
            answer <<- c(answer, process_row(row['id']))
        }
    }

    by(completed, 1:nrow(completed), add_to_answer)
    
    answer
}

# cr <- corr('data/specdata')
# length(cr)
# head(cr)
# summary(cr)

# RNGversion("3.5.1")  
# set.seed(42)
# cc <- complete("data/specdata", 332:1)
# use <- sample(332, 10)
# print(cc[use, "nobs"])

# cr <- corr("data/specdata")                
# cr <- sort(cr)   
# RNGversion("3.5.1")
# set.seed(868)                
# out <- round(cr[sample(length(cr), 5)], 4)
# print(out)

# cr <- corr("data/specdata", 129)                
# cr <- sort(cr)                
# n <- length(cr)    
# RNGversion("3.5.1")
# set.seed(197)                
# out <- c(n, round(cr[sample(n, 5)], 4))
# print(out)

cr <- corr("data/specdata", 2000)                
n <- length(cr)                
cr <- corr("data/specdata", 1000)                
cr <- sort(cr)
print(c(n, round(cr, 4)))
