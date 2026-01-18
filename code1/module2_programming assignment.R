#######################################################################
# Data wrangling in R
# Nelson De La Rosa  
# DSCI 605: Data Visualization
#######################################################################

# 1. Load the library
# Install the tidyverse package for wrangling dataset
install.packages("tidyverse")

# Load the tidyverse package for data manipulation functions
library(tidyverse)


# 2. Set the working directory
# Set the current working directory where the data file is located
# working directory: /home/rstudio/Module2
setwd("/home/rstudio/Module2")


# 3. Read csv file into R using the function read_csv()
# Read the salaries.csv file into R as a data frame
Salaries <- read_csv("salaries.csv")

# View Salaries dataset in Excel-type format
view(Salaries)

# Check number of rows and columns in Salaries
dim(Salaries)


# Count number of missing values in the salary column
sum(is.na(Salaries$salary))


# 4. Use select(), filter(), group_by(), count() in this part and combine them 
# with pipe operator
# Create a new data frame with required variables (columns), filter missing 
# salaries, group by rank, discipline, and sex, and counting observations
Salaries_new <- Salaries %>%
  select(rank, discipline, sex, salary) %>%    # Step 1: Select columns rank, 
  # discipline, sex, salary
  
  filter(!is.na(salary)) %>%                   # Step 2: Remove rows with 
  # missing values in salary
  
  group_by(rank, discipline, sex) %>%          # Step 3: Group by rank, 
  # discipline, sex
  
  count(name = "n")                            # Step 4: Count frequency in each 
# group


# View the "Salaries_new" dataset in Excel-type format
view(Salaries_new)

# Check number of rows and columns in Salaries_new
dim(Salaries_new)


# 5. using spread() to transfer sex column to many more columns based on the 
# values in sex
# Convert the sex column into separate columns (Female and Male) and fill 
# missing combinations with FALSE
wide <- Salaries_new %>%
  spread(key = sex, value = n, fill = FALSE)

# View wide dataset in Excel-type format
view(wide)

# Check number of rows and columns in wide
dim(wide)

# 6. Reshape the table from wide to long: using gather() to combine multiple 
# sex related columns to one column sex
# Combine the Female and Male columns into a single column named sex and store 
# the corresponding counts in a column named n
# Remove rows with missing values
long <- wide %>%
  gather(
    key   = sex,            # New column for sex values
    value = n,              # New column for counts
    Female, Male,           # Columns to be combined
    na.rm = TRUE            # Remove rows with missing values
  )

# View long dataset in Excel-type format
view(long)

# Check number of rows and columns in long
dim(long)

Accepted 
#######################################################################
# Data wrangling in R
# Nelson De La Rosa  
# DSCI 605: Data Visualization
#######################################################################

# 1. Load the library
# Install the tidyverse package for wrangling dataset
install.packages("tidyverse")

# Load the tidyverse package for data manipulation functions
library(tidyverse)


# 2. Set the working directory
# Set the current working directory where the data file is located
# working directory: /home/rstudio/Module2
setwd("/home/rstudio/Module2")


# 3. Read csv file into R using the function read_csv()
# Read the salaries.csv file into R as a data frame
Salaries <- read_csv("salaries.csv")

# View Salaries dataset in Excel-type format
view(Salaries)

# Check number of rows and columns in Salaries
dim(Salaries)


# Count number of missing values in the salary column
sum(is.na(Salaries$salary))


# 4. Use select(), filter(), group_by(), count() in this part and combine them 
# with pipe operator
# Create a new data frame with required variables (columns), filter missing 
# salaries, group by rank, discipline, and sex, and counting observations
Salaries_new <- Salaries %>%
  select(rank, discipline, sex, salary) %>%    # Step 1: Select columns rank, 
  # discipline, sex, salary
  
  filter(!is.na(salary)) %>%                   # Step 2: Remove rows with 
  # missing values in salary
  
  group_by(rank, discipline, sex) %>%          # Step 3: Group by rank, 
  # discipline, sex
  
  count(name = "n")                            # Step 4: Count frequency in each 
# group


# View the "Salaries_new" dataset in Excel-type format
view(Salaries_new)

# Check number of rows and columns in Salaries_new
dim(Salaries_new)


# 5. using spread() to transfer sex column to many more columns based on the 
# values in sex
# Convert the sex column into separate columns (Female and Male) and fill 
# missing combinations with FALSE
wide <- Salaries_new %>%
  spread(key = sex, value = n, fill = FALSE)

# View wide dataset in Excel-type format
view(wide)

# Check number of rows and columns in wide
dim(wide)

# 6. Reshape the table from wide to long: using gather() to combine multiple 
# sex related columns to one column sex
# Combine the Female and Male columns into a single column named sex and store 
# the corresponding counts in a column named n
# Remove rows with missing values
long <- wide %>% gather(key = sex, value = n, Female, Male, na.rm = TRUE)


# View long dataset in Excel-type format
view(long)

# Check number of rows and columns in long
dim(long)
