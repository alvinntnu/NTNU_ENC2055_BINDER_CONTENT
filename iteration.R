a.vec <- c(1:10)
## `sqrt()` is applied to all elements of the vector one by one
sqrt(a.vec)
## `round()` is applied to all elements of the vector one by one
round(sqrt(a.vec), 2)

a.list <- list(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
sqrt(a.list)

a.list <- list(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
results <- vector() # empty list holder

for(i in 1:length(a.list)){
  results[i] <- sqrt(a.list[[i]])
}

results

exams.list <- list(
  class1 = round(runif(30, 0, 100)), # 30 tokens of random numbers in the range <0, 100>
  class2 = round(runif(30, 0, 100)),
  class3 = round(runif(30, 0, 100)),
  class4 = round(runif(30, 0, 100)),
  class5 = round(runif(30, 0, 100))
)
exams.list


mean(exams.list)

set.seed(123) # Make sure we get the same results
exams.list.means <- list(
  class1mean = mean(exams.list$class1),
  class2mean = mean(exams.list$class2),
  class3mean = mean(exams.list$class3),
  class4mean = mean(exams.list$class4),
  class5mean = mean(exams.list$class5)
)

exams.list.means


library(tidyverse)

map(exams.list, mean)
## Or, alternatively:
# exams.list %>% map(mean)





## apply `mean()` to all elements of `exam.list` 
## and return the output as data frame
map_df(exams.list, mean)

## apply `mean()` to all elements of `exam.list`
## and return the output as a double/numeric vector
map_dbl(exams.list, mean)





map_df(exams.list, function(x) c(median(x), sd(x)))

## # exams.list %>%
## #   data.frame %>%
## #   mutate(ID = row_number()) %>%
## #   pivot_longer(cols = class1:class5, names_to="CLASS", values_to="SCORES")

## reading utf8 file
con <- file(description = "demo_data/dict-ch-idiom.txt",
            encoding = "utf-8")
texts <- readLines(con)
close(con)

## convert into data frame
idiom <- data.frame(string = texts)
idiom

## Take a look at the first ten idioms
x <- idiom$string[1:10]

## Check whether they have repeated characters
str_detect(x, ".*(.).*\\1.*")

idiom %>%
  mutate(duplicate = str_detect(string, ".*(.).*\\1.*")) %>%
  filter(duplicate)

## Regex patter for animal characters
pat <- "[鼠牛虎兔龍蛇馬羊猴雞狗豬]"
## Output of str_extract_all
output <- str_extract_all(idiom$string, pat)

## Example
idiom[895,]
output[895]











## 
## FUNCTION_NAME <- function(ARG1, ARG2) {
## 
##   THINGS TO BE DONE WITHIN THE FUNCTION
## 
##   return(...)
## }
## 

## define function
my_center <- function(x) {
  (x - mean(x))/sd(x)
}

## apply function via map()
map(exams.list, my_center)

## try different return structures
map_df(exams.list, my_center)








y <- c(1, 4, 6, 10, 20)
my_z(y)
