## Loading libraries
library(tidyverse)

## Data Import
my_df <- read_csv(file = "demo_data/data-nobel-laureates.csv",
                  locale = locale(encoding="UTF-8"))

## Peek
my_df

## data overview
str(my_df)

## data summary
summary(my_df)



## Original column names
names(my_df)

## Overwrite the original with new ones
names(my_df) <- str_replace_all(names(my_df), "\\s","_")

## Autoprint updated my_df
my_df

## Check the names again
names(my_df)

## Define a custom function
check_num_NA <- function(x){
  sum(is.na(x))
}

## Map the function to the data frame
my_df %>% map_df(check_num_NA)
my_df %>% map_int(check_num_NA)

## Alternatively, you can write this way:
# map_df(my_df, check_num_NA)
# map_int(my_df, check_num_NA)

my_df %>%
  filter(is.na(Sex))

## Filter incomplete cases
my_df %>%
  filter(!complete.cases(.)) -> my_df_missing
my_df_missing

## Check the percentage of incomplete cases
nrow(my_df_missing)/nrow(my_df)

## Check laureates from China
my_df %>%
  filter(Birth_Country == "China")

## Check `Year` and `Bird_Date`
## Information implicit in these columns
my_df %>%
  select(Laureate_ID, Year, Full_Name, Birth_Date, Category)

## Data preprocessing
nobel_winners <- my_df %>%
  mutate(id = row_number()) %>% ## unique row indices
  mutate_if(is.character, tolower) %>% ## lower all character vectors
  distinct_at(vars(Full_Name, Year, Category), .keep_all = TRUE) %>% ## duplicates
  mutate(Decade = 10 * (Year %/% 10), ## create new factors
         Prize_Age = Year - lubridate::year(Birth_Date))

## check
nobel_winners

nobel_winners %>%
  filter(is.na(Prize_Age)) %>%
  select(Laureate_ID, Year, Full_Name, Birth_Date, Prize_Age)

nobel_winners %>%
  filter(Birth_Country == "china") %>%
  select(Laureate_ID, Full_Name, Year, Category)

## statistics
nobel_winners %>% 
  count(Category) %>%
  mutate(percent = round(n/sum(n),2))

## barplots
nobel_winners %>%
  count(Category) %>%
  ggplot(aes(x = Category, y = n, fill = Category)) +
  geom_col() +
  geom_text(aes(label = n), vjust = -0.25) +
  labs(title = "No. of Laureates in Different Disciplines", x = "Category", y = "N") +
  theme(legend.position = "none")

## barplots (ordered)
nobel_winners %>% 
  count(Category) %>% 
  ggplot(aes(x = fct_reorder(Category, -n), y = n, fill = Category)) +
  geom_col() +
  geom_text(aes(label = n), vjust = -0.25) +
  labs(title = "No. of Laureates in Different Disciplines", x = "Category", y = "N") +
  theme(legend.position = "none")

## barplot (dynamic)

## Uncomment if you have not installed this library
# install.packages("gganimate", dependencies = T)
library(gganimate) 

my_df %>% 
  count(Category) %>% 
  mutate(Category = fct_reorder(Category, -n)) %>% 
  ggplot(aes(x = Category, y = n, fill = Category)) +
  geom_text(aes(label = n), vjust = -0.25) +
  geom_col()+
  labs(title = "No. of Laureates in Different Disciplines", x = "Category", y = "N") +
  theme(legend.position = "none") +
  transition_states(Category)  +
  shadow_mark(past = TRUE)

## statistics
summary(nobel_winners$Prize_Age)
psych::describe(nobel_winners$Prize_Age) %>% t

## histogram
nobel_winners %>%
  filter(!is.na(Prize_Age)) %>%
  ggplot(aes(x = Prize_Age)) + 
  geom_histogram(color="white")

## boxplot
nobel_winners %>%
  filter(!is.na(Prize_Age)) %>%
  ggplot(aes(y = Prize_Age)) +
  geom_boxplot()

## Statistics
nobel_winners %>%
  filter(!is.na(Prize_Age)) %>%
  group_by(Category) %>%
  summarize(mean_age = mean(Prize_Age),
            sd_age = sd(Prize_Age)) %>%
  ungroup %>%
  arrange(mean_age)

## Histogram
nobel_winners %>% 
  filter(!is.na(Prize_Age)) %>%
  ggplot(aes(x = Prize_Age, fill = Category, color = Category))  +
  geom_histogram(color="white") +
  facet_wrap(~Category) +
  theme(legend.position = "none")

## Density graphs
nobel_winners %>% 
  filter(!is.na(Prize_Age)) %>%
  ggplot(aes(x = Prize_Age, fill = Category, color = Category))  +
  geom_density() +
  facet_wrap(~Category) +
  theme(legend.position = "none")

## boxplot
nobel_winners %>%
  filter(!is.na(Prize_Age)) %>%
  ggplot(aes(x = Category, y = Prize_Age, fill = Category))+
  geom_boxplot(notch=T)

## mean and CI plots
nobel_winners %>%
  filter(!is.na(Prize_Age)) %>%
  ggplot(aes(Category, Prize_Age, fill = Category)) +
  stat_summary(fun = mean, geom = "bar", fill="white", color="black") +
  stat_summary(fun.data = function(x) mean_se(x, mult = 1.96),
               geom = "errorbar", width = 0.1, color="grey40")

library(ggridges)

nobel_winners %>% 
  filter(!is.na(Prize_Age)) %>%
  ggplot(aes(x = Prize_Age,
             y = Category,
             fill = Category)) +
  geom_density_ridges()

## statistics
nobel_winners %>%
  filter(!is.na(Sex)) %>%
  count(Sex) %>%
  mutate(percent = round(n/sum(n),2))

## graphs
nobel_winners %>%
  filter(!is.na(Sex)) %>%
  ggplot(aes(Sex)) +
  geom_bar(fill="white",color="black") 

## statistics
nobel_winners %>%
  filter(!is.na(Sex) & !is.na(Prize_Age)) %>%
  group_by(Sex) %>%
  summarize(mean_prize_age = mean(Prize_Age),
            sd_prize_age = sd(Prize_Age),
            min_prize_age = min(Prize_Age),
            max_prize_age = max(Prize_Age),
            N = n()) -> sum_sex_age

## Check
sum_sex_age

## boxplot
nobel_winners %>%
  filter(!is.na(Sex) & !is.na(Prize_Age)) %>%
  ggplot(aes(Sex, Prize_Age, fill=Sex)) + 
  geom_boxplot(notch=T, color="grey30") + 
  scale_fill_manual(values = c("lightpink","lightblue"))

## Mean and CI Plot
## you have to have this for `stat_summary()`
# require(Hmisc) 
nobel_winners %>%
  filter(!is.na(Sex) & !is.na(Prize_Age)) %>%
  ggplot(aes(Sex, Prize_Age, color=Sex)) +
  stat_summary(fun = mean, geom = "point", size = 2) +
  stat_summary(fun.data = function(x) mean_se(x, mult=1.96), 
               geom = "errorbar",
               width = 0.1)


## Barplot
sum_sex_age %>%
  pivot_longer(cols = c("mean_prize_age","min_prize_age", "max_prize_age"),
               names_to = "Prize_Age",
               values_to = "Age") %>%
  mutate(Prize_Age = str_replace_all(Prize_Age, "_prize_age$","")) %>%
  ggplot(aes(Sex, Age, fill=Prize_Age)) +
  geom_bar(stat="identity", 
           width = 0.8, 
           color="white",
           position = position_dodge(0.8))

## Explore the data
nobel_winners %>%
  filter(Birth_Country == "united states of america") %>%
  select(Year, Category, Full_Name, Birth_City)

nobel_winners %>%
  filter(Birth_Country == "united states of america") %>%
  mutate(Birth_State = str_replace(Birth_City, "([^,]+), ([a-z]+)$", "\\2")) %>%
  group_by(Birth_State) %>%
  summarize(N = n()) %>%
  arrange(desc(N), Birth_State) -> sum_state

sum_state

sum_state %>%
  mutate(Birth_State = fct_reorder(str_to_upper(Birth_State), N)) %>%
  ggplot(aes(Birth_State, N, fill = N)) +
  geom_col() +
  coord_flip() +
  scale_fill_viridis_c(guide=F) +
  labs(y = "Number of Winners", x = "Winner Birth States")




## Loading mapping table
US_states <- read_csv("demo_data/US-states.csv")
US_states

## Joining tables
sum_state %>%
  mutate(Birth_State = str_to_upper(Birth_State)) %>%
  left_join(US_states, by = c("Birth_State" = "Code"))
