library(tidyverse)
## library(stringr) # loaded when loading tidyverse





word_string <- c("the", "word", "string")
word_string %>%
  str_length


str_c("the","word","string")
str_c("the","word","string",sep = "_")

str_c(word_string, sep = "_")

## x <- letters[1:10]
## y <- c("suffix1", "suffix2")
## z <- LETTERS[1:10]
## 
## str_c(x, y)
## str_c(x, z)
## str_c(x, z, sep = "_")
## 
## str_c(x, collapse="")
## str_c(x, collapse=" ")
## str_c(x, z, collapse="")
## str_c(x, z, collapse=" ")
## str_c(x, z, sep = "_", collapse = " ")
## 
## str_c(x, z, x, sep="_")
## 

x <- letters[1:10]
y <- c("suffix1", "suffix2")
z <- LETTERS[1:10]

str_c(x, z, sep = "_")
str_c(x, z , sep = "/")

str_c(x, collapse = "")
str_c(x, collapse = " ")
str_c(x, collapse = "_")

str_c(x, z, sep="_", collapse=" ")
str_c(x, z, sep="-", collapse="/")

str_sub(string = "international", 
        start = 1,
        end = 5)

## create a vector
set.seed(12)
random_fruits <- sample(fruit, 5) ## `fruit` is a default vector
random_fruits
## str_sub() all strings in the vector
str_sub(random_fruits, start = 1, end = 3)

x <- c("apple", "banana", "pear")
## Show only strings with the match
str_view(string = x, pattern = ".a")
## Show all strings of the input x
str_view_all(string = x, pattern = ".a")

## ## Please install `remotes` if you haven't
## install.packages("remotes")
## remotes::install_github("gadenbuie/regexplain")



str_detect(string = x, pattern = ".a") ## Boolean
str_match(string = x, pattern = "(.)a") ## Exact matches (group)
str_match_all(string = x, pattern = "(.)a") ## Exact matches all (group)
str_extract(string = x, pattern = ".a") ## Exact matches
str_extract_all(string = x, pattern = ".a") ## Exact matches all
str_subset(string = x, pattern = ".a") ## Input strings with matches

str1  <- "hello world!"
str2  <- "hello　world!"
str_view(str1)
str_view(str2)



x <- c("apple", "banana", "pear")
str_view(string = x, pattern = ".a.")

x <- c("apple", "banana","pear", "orange. And")
str_view(string = x, pattern = ".")

str_view(string = x, pattern = "\\.")







x <- c("apple", "banana", "pear")
str_view(x, "^a.") ## pattern for two-character match

x <- c("apple", "banana", "pear")
str_view(x, ".a$") ## pattern for two-character match

x <- c("apple pie", "apple", "apple cake")
str_view(x, "^apple$") ## pattern for five-character match

x <- c("apple is good", 
       "banana is better than apple", 
       "an apple a day keeps the doctor away")
str_view(x, "^apple")
str_view(x, "apple$")



x<-c("apple","apple123","banana1")
str_view(string = x , pattern = "\\d")


str_view_all(string = x , pattern = "\\d")

x <- c("aeiouAEIOU1234_ .\\$%-*()")
str_view(string = x, pattern = "\\w", html = T)
#compare
str_view(string = x, pattern = ".", html = T)

x <- c("grey", "gray")
str_view(string = x, pattern = "gr[ea]y")

x <- c("grey", "gray")
str_view(string = x, pattern = "[^aeiou]")

x <- "Roman numerals: MDCCCLXXXVIII"
str_view(x, "CC?")  
str_view(x, "X+")

x <- "Roman numerals: MDCCCLXXXVIII"
str_view(x, "C{2}")
str_view(x, "C{2,}")
str_view(x, "C{2,3}")

x <- "aaabbbababcdf"

str_view(x, "ab{2,}") # the scope of the quantifier is `b`
str_view(x, "(ab){2,}") # the scope of the quantifier is `ab`

x <- "Roman numerals: MDCCCLXXXVIII"
str_view(x, "C{2,}")

## x <- "Roman numerals: MDCCCLXXXVIII"
## str_view(x, "CL?") # find longest match
## str_view(x, "CL??") # find shortest match
## str_view(x, "CLX+") # find longest match
## str_view(x, "CLX+?") # find shortest match
## str_view(x, "CLX*") # find longest match
## str_view(x, "CLX*?") # find shortest match

# `fruit` is a preloaded vector from `stringr`
x <- fruit %>% head(10)
x

str_view(x, ".{2}")

str_view(x, "(.)\\1") ## two-character sequence 











## `STRING`
## use ten fruit names as an example
x <- fruit %>% head(10)
x

str_detect(x, "e$")

x[str_detect(x, "e$")]

sum(str_detect(x, "e$"))

str_subset(x, "e$")

x[str_detect(x, "e$")] ## verbose version

str_extract(x, "[aeiou]")

str_subset(x, "[aeiou]")

## find all vowel characters from the strings
str_extract(x, "[aeiou]") ## find only the first match of each string
str_extract_all(x, "[aeiou]") ## find all the matches of each string

## find one vowel letter at the string-initial position
str_extract(x, "^[aeoiu]")

## find strings with string-initial vowel letter
str_extract(x, "^[aeiou].+")

str_match(x, "(bl)([aeiou]+)")

m <-str_match(x, "(bl)([aeiou]+)")
m[,3] ## col1: match; col2: 1st group; col3: 2nd group

str_extract(x, "(bl)([aeiou]+)")

str_match_all(x, "([pb])([aeiou]+)")





str_replace(string = x, pattern = "[aeiou]", replacement = "V")

str_replace_all(string = x, pattern = "[aeiou]", replacement = "V")

print(x)
str_split(x, "[^aeiou]+")

## five sentences
y <- sentences %>% head(5)
y

## Break each sent into tokens 
## based on any sequences of non-word characters
str_split(string = y, pattern = "[^\\w]+")

fields <- c("Name: Hadley", "Country: NZ", "Age: 35")

## Default list as return
fields %>% str_split("[^\\w]+")
## Data frame as return
fields %>% str_split("[^\\w]+", simplify = TRUE)

American.dates <- c("7/31/1976", "02.15.1970", "11-31-1986", "04/01.2020")



sentences[1:5]
length(sentences)





x <- c("It's a three-legged chair.", "The book (you read) was quite boring!")





x <- "中央(Nc)　流行(VH)　疫情(Na)　指揮(VC)　中心(Nc)　醫療(VC)　應變組(Nc)　副組長(Na)　羅一鈞(Nb)　今天(Nd)　說明(VE)　，(COMMACATEGORY)　截至(P)　12月(Nd)　1日(Nd)　全球(Nc)　累計(VJ)　至少(Da)　27(Neu)　國(Nc)　、(PAUSECATEGORY)　共有(VJ)　370(Neu)　例(Na)　確診(VA)　感染(VJ)　Omicron(FW)　變異株(Na)　，(COMMACATEGORY)　多(D)　來自(VJ)　南非(Nc)　或(Caa)　具(VJ)　非洲(Nc)　國家(Na)　旅遊史(Na)　。(PERIODCATEGORY)"



x <- "中央(Nc)　流行(VH)　疫情(Na)　指揮(VC)　中心(Nc)　醫療(VC)　應變組(Nc)　副組長(Na)　羅一鈞(Nb)　今天(Nd)　說明(VE)　，(COMMACATEGORY)　截至(P)　12月(Nd)　1日(Nd)　全球(Nc)　累計(VJ)　至少(Da)　27(Neu)　國(Nc)　、(PAUSECATEGORY)　共有(VJ)　370(Neu)　例(Na)　確診(VA)　感染(VJ)　Omicron(FW)　變異株(Na)　，(COMMACATEGORY)　多(D)　來自(VJ)　南非(Nc)　或(Caa)　具(VJ)　非洲(Nc)　國家(Na)　旅遊史(Na)　。(PERIODCATEGORY)"



win <- c("Windows2000", "Windows", "WindowsNT", "Windows7", "Windows10")
str_view(win, "Windows(95|98|NT|2000)")

str_replace(win, 
            pattern = "Windows(95|98|NT|2000)",
            replacement = "OldSystem")



str_view(win, "Windows(?=95|98|NT|2000)")

str_replace(string = win, 
            pattern = "Windows(?=95|98|NT|2000)",
            replacement = "OldSystem")

str_view(win, "Windows(?!7|10)")
str_replace(string = win,
            pattern = "Windows(?!7|10)",
            replacement = "NewSystem")

dollars <- c("NT$200", "US$200", "EURO$200", "POUND$200", "$200")
str_replace_all(dollars, 
                "(?<=NT|US)\\$200",
                "****")

dollars <- c("NT$200", "US$200", "EURO$200", "POUND$200", "$200")
str_replace_all(dollars, 
                "(?<!NT|US)\\$200",
                "****")

fruit[1:10]





fruit[1:10]







df <- data.frame(
  x = 1:4,
  y = c("wk 3", "week-1", "7", "w#9")
)
df



df <- data.frame(
  WORD = fruit[1:10]
)
df





df <- data.frame(x = c("I我", "love愛", "you你"))
df



df <- data.frame(x = c("1-12周", "1-10周", "5-12周"))
df



df <- data.frame(
  x = c("1234", "B246", "217C", "2357f", "21WD4")
)
df





df <- data.frame(
  x = c("12W34", "AB2C46", "B217C", "akTs6df", "21WD4")
)
df





## Loading file
all_idioms <- readLines(con = "demo_data/dict-ch-idiom.txt",encoding = "UTF-8")

## Checking first 6 tokens
head(all_idioms)

## Checking last 6 tokens
tail(all_idioms)

## total number of tokens
length(all_idioms)

idiom <- data.frame(IDIOMS = all_idioms)
idiom %>% head

idiom %>%
  filter(str_detect(IDIOMS, ".來.去"))

## Version 1
idiom_laiqu <-idiom %>%
  filter(str_detect(IDIOMS, ".來.去")) %>%
  mutate(PATTERN = str_replace(IDIOMS, "(.)來(.)去", "\\1_\\2")) %>%
  separate(PATTERN, into = c("W1", "W2"), sep = "_")
idiom_laiqu

# ## version 2
# require(tidyr)
# idiom %>%
#   filter(str_detect(string, ".來.去")) %>%
#   mutate(string2 = string) %>%
#   extract(col="string2",
#           into=c("w1","w2"),
#           regex = "(.)來(.)去")

# Create `structure` column
idiom_laiqu_2 <- idiom_laiqu %>%
  mutate(STRUCTURE = ifelse(W1==W2, "XX","XY")) 

idiom_laiqu_2 

# Count `structure` frequecnies
idiom_laiqu_count <- idiom_laiqu_2 %>%
  count(STRUCTURE)

idiom_laiqu_count

# Create barplots
idiom_laiqu_count %>%
  ggplot(aes(STRUCTURE, n, fill = STRUCTURE)) + 
  geom_col()

##########################
### Another alterantive###
##########################

# idiom_laiqu %>%
#   mutate(STRUCTURE = ifelse(W1==W2, "XX","XY")) %>%
#   count(STRUCTURE) %>%
#   ggplot(aes(STRUCTURE, n, fill = STRUCTURE)) +
#   geom_col()
  

idiom <- data.frame(string = readLines("demo_data/dict-ch-idiom.txt"))
