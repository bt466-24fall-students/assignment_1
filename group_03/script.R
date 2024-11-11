library(readr)

# Read the CSV data into a data frame using a relative path
business_data <- read_csv("raw_data/dataset.csv", show_col_types = FALSE)


# Print the first few rows of the data to verify
print(head(business_data))


# Note: Column 4 ('ITEM CODE') contains non-numeric values in some rows, which may need addressing for further analysis.
# When running script you will receive a Warning message: One or more parsing issues, call `problems()` on your data frame for details, e.g.: dat <- vroom(...) problems(dat)
# run problems(business_data) to see exact problem
