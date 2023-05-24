## ASCII Characters to Code Numbers (Integers)
utf8ToInt("j") ## code number in decimal
utf8ToInt("J") ## code number in decimal

## ASCII Code Numbers in Hexadecimal Format
as.hexmode(utf8ToInt("j")) ## code number in hex
as.hexmode(utf8ToInt("J")) ## code number in hex



## A char not in ASCII
utf8ToInt("ü") ## code number in decimal mode
as.hexmode(utf8ToInt("ü")) ## code number in hexadecimal mode




uchardet::detect_file_enc("demo_data/corp-alice.txt")
uchardet::detect_file_enc("demo_data/data-chinese-poem-utf8.txt")
uchardet::detect_file_enc("demo_data/data-chinese-poem-big5.txt")



## Characters
e1 <- "Q"

Encoding(e1)

## Convert the encoding to UTF-8/Big-5
e2 <- iconv(e1, to = "UTF-8")
Encoding(e2) ## ASCII chars are never marked with a declared encoding
e2

## Convert char to code number 
e1_decimal <- utf8ToInt(e1)
e1_decimal ## code point of `Q`

## Convert code number into hex mode
e1_hex <- as.hexmode(e1_decimal)
e1_hex ## code point in hexadecimal mode of `Q`

print("\u51")
print("\u5987")

c1 <- "臺"
Encoding(c1) ## Non-ASCII char encoding in R. What's the output in Windows?

c1_decimal<- utf8ToInt(c1)
c1_decimal

c1_hex<-as.hexmode(c1_decimal)
c1_hex

print("\u81fa")





alice <- readLines(con = "demo_data/corp-alice.txt" )
alice[1:10]
class(alice)
length(alice)

## Reading a big5 file
infile <- file(description = "demo_data/data-chinese-poem-big5.txt",
               encoding = "big-5") ## file as a connection
text_ch_big5 <- readLines(infile) ## read texts from the connection
close(infile) ## close the connection

writeLines(text_ch_big5)

## Reading a utf-8 file
infile <- file(description = "demo_data/data-chinese-poem-utf8.txt",
               encoding = "utf-8") 
text_ch_big5 <- readLines(infile) 
close(infile) 

writeLines(text_ch_big5) 

## Reading a gb18030 file
infile <- file(description = "demo_data/data-chinese-poem-gb2312.txt",
               encoding = "gb2312") 
text_ch_gb <- readLines(infile) 
close(infile) 

writeLines(text_ch_gb) 

## x <- readLines("demo_data/data-chinese-poem-big5.txt", encoding="big-5")
## y <- scan("demo_data/data-chinese-poem-big5.txt", what="c",sep="\n", encoding="big-5")
## y1 <- scan("demo_data/data-chinese-poem-big5.txt", what="c",sep="\n", fileEncoding="big-5")
## 
## # x <- readLines("demo_data/data-chinese-poem-gb2312.txt", encoding="gb2312")
## # y <- scan("demo_data/data-chinese-poem-gb2312.txt", what="c",sep="\n", encoding="gb2312")
## # y1 <- scan("demo_data/data-chinese-poem-gb2312.txt", what="c",sep="\n", fileEncoding="gb2312")
## 
## ## The input texts do not show up properly?
## writeLines(x)
## writeLines(y)
## writeLines(y1)
## ## convert the input texts into your system default encoding
## writeLines(iconv(x, from="big-5",to="utf-8"))
## writeLines(iconv(y, from="big-5", to="utf-8"))

output <- sample(alice[nzchar(alice)],10)
writeLines(output, con = "corp-alice-2.txt")

x <- "鳳凰臺上鳳凰遊，鳳去臺空江自流。"
Encoding(x) # `iconvlist()` check all encodings

## For Mac Users, we can output files in different encodings as follows.
## method1
writeLines(x, con = "output_test_1.txt")

## method2
con <- file(description = "output_test_2.txt", encoding="big-5")
writeLines(x, con)
close(con)

## method3
con <- file(description = "output_test_3.txt", encoding="utf-8")
writeLines(x, con)
close(con)

## For Windows Users, please try the following?
x_big5 <- iconv(x, from="utf-8", to = "big-5")
writeLines(x, con = "output_test_w_1.txt", useBytes = TRUE)
writeLines(x_big5, con = "output_test_w_2.txt", useBytes = TRUE)


## Check encodings
uchardet::detect_file_enc("output_test_1.txt") ## mac1
uchardet::detect_file_enc("output_test_2.txt") ## mac2
uchardet::detect_file_enc("output_test_3.txt") ## mac3
uchardet::detect_file_enc("output_test_w_1.txt") ## win1
uchardet::detect_file_enc("output_test_w_2.txt") ## win2











library(readr)
nobel <- read_csv(file = "demo_data/data-nobel-laureates.csv", 
                  locale = locale(encoding="UTF-8"))
nobel

gender_freq <- read_tsv(file = "demo_data/data-stats-f1-freq.tsv",
                        locale = locale(encoding="UTF-8"))
gender_freq





## ## Example of `relative path`
## x <- read_csv("data-bnc-bigram.csv")

## ## Example of `relative path` with a sub-directory
## x <- read_csv("demo_data/data-bnc-bigram.csv")

## ## Example of `relative path` from the parent directory of the working dir
## x <- read_csv("../data-bnc-bigram.csv")

## getwd()
## setwd()

## ## get all filenames contained in a directory
## dir(path = "demo_data/",
##     full.names = FALSE, ## whether to get both filenames & full relative paths
##     recursive = FALSE)
## 
## ## check whether a file/directory exists
## file.exists("demo_data/data-bnc-bigram.csv")
## 
## ## check all filenames contained in the directory
## ## that goes up two levels from the working dir
## dir(path = "../../")

## Corpus root directory
corpus_root_dir <- "demo_data/shakespeare"

## Get the filenames from the directory
flist <- dir(path = corpus_root_dir,
             full.names = TRUE)
flist

## Holder for all data
flist_texts <- list()

## Traverse each file
for (i in 1:length(flist)) {
  flist_texts[[i]] <- readLines(flist[i])
}

## peek at first file content
head(flist_texts[[1]]) ## first 6 
tail(flist_texts[[1]]) ## last 6

## Load data from all files
flist_text <- sapply(flist, readLines)
## peek at first file content
head(flist_texts[[1]]) ## first 6 
tail(flist_texts[[1]]) ## last 6
