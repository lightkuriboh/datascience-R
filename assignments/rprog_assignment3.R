
path <- 'data/rprog_data_ProgAssignment3-data/'
data_file <- 'outcome-of-care-measures.csv'

my_data <- read.csv(paste(path, data_file, sep = ''), colClasses = 'character')

head(my_data)
str(my_data)
ncol(my_data)

unique(my_data['State'])[[1]]

best.R <- function (dat = data.frame()) {
    
    morality <- c('heart attack' = 11, 'heart failure' = 17, 'pneumonia' = 23)
  
    best <- function (state, outcome) {
        id <- morality[outcome]
        
        if (is.na(id)) {
            return ('invalid outcome')
        }
      
        if (!any(dat['State'] == state)) {
            return ('invalid state')
        }
      
        data_in_state <- split(dat, dat['State'])[state]
        
        mx <- -1
        name <- ''
        apply(X = as.matrix(data_in_state[[1]]), MARGIN = 1, function (row) {
            val <- as.numeric(row[id])
            if (is.na(val)) {
                return()
            }
            if (mx == -1) {
                mx <<- val
                name <<- row[2]
            } else
            if (val < mx) {
                mx <<- val
                name <<- row[2]
            } else if (val == mx) {
                if (row[2] < name) {
                    name <<- row[2]
                }
              
            }
        })
        
        if (mx == -1) {
            return (NA)
        }
        name[[1]]
    }
    
    list(best = best)
}

my_best.R <- best.R(my_data)
my_best.R$best('MD', 'pneumonia')
my_best.R$best("SC", "heart attack")
my_best.R$best("NY", "pneumonia")
my_best.R$best("AK", "pneumonia")
my_best.R$
my_best.R$
my_best.R$
my_best.R$
my_best.R$

rankhospital.R <- function (dat = data.frame()) {
    morality <- c('heart attack' = 11, 'heart failure' = 17, 'pneumonia' = 23)
    
    rankhospital <- function(state, outcome, num = "best") {
        id <- morality[outcome]
        
        if (is.na(id)) {
            return ('invalid outcome')
        }
        
        if (!any(dat['State'] == state)) {
            return ('invalid state')
        }
        
        data_in_state <- split(dat, dat['State'])[state]
      
        hospital_name <- vector(mode = 'character')
        moral_rate <- vector(mode = 'numeric')
        
        apply(X = as.matrix(data_in_state[[1]]), MARGIN = 1, function (row) {
            val <- as.numeric(row[id])
            if (is.na(val)) {
                return()
            }
            hospital_name <<- c(hospital_name, row[2][[1]])
            moral_rate <<- c(moral_rate, val)
        })
        
        hospital_ranking <- data.frame(moral_rate, hospital_name)
        
        hospital_ranking <- hospital_ranking[
                              order(hospital_ranking[, 'moral_rate'], 
                                    hospital_ranking[, 'hospital_name']),
                            ]
        
        id <- 1
        if (num == 'best') {
            id <- 1
        }
        else 
        if (num == 'worst') {
            id <- nrow(hospital_ranking)
        } else {
            id <- num
        }
        
        if (id > nrow(hospital_ranking) || id < 1) {
            return (NA)
        }
        
        hospital_ranking[id, 'hospital_name']
    }
    
    list(rankhospital = rankhospital)
}

my_best_hospital_ranking <- rankhospital.R(my_data)
my_best_hospital_ranking$rankhospital('MD', 'heart attack', 'worst')
my_best_hospital_ranking$rankhospital("NC", "heart attack", "worst")
my_best_hospital_ranking$rankhospital("WA", "heart attack", 7)
my_best_hospital_ranking$rankhospital("TX", "pneumonia", 10)
my_best_hospital_ranking$rankhospital("NY", "heart attack", 7)
my_best_hospital_ranking$
my_best_hospital_ranking$
my_best_hospital_ranking$

rankAll.R <- function (dat = data.frame()) {
    morality <- c('heart attack' = 11, 'heart failure' = 17, 'pneumonia' = 23)
    
    rankall <- function (outcome, num = 'best') {

      if (is.na(morality[outcome])) {
          return ('invalid outcome')
      }
      
        uni <- unique(dat['State'])[[1]]
        uni <- uni[order(uni)]
        hospital <- vector()
        
        for (state in uni) {
            res <- as.character(my_best_hospital_ranking$rankhospital(state, outcome, num))
            hospital <- c(hospital, res)
        }
        
        data.frame(hospital, state = uni)
    }
    
    list(rankall = rankall)
}

my_rankAll.R <- rankAll.R(my_data)
head(my_rankAll.R("heart attack", 4))

r <- my_rankAll.R("heart failure", 10)
as.character(subset(r, uni == "NV")$hospital)

             