# Path to Git Bash on your computer
git_bash_path <- "C:/Program Files/Git/git-bash.exe"
# Define the Kaggle dataset URL and file paths
kaggle_url <- "https://www.kaggle.com/api/v1/datasets/download/taseermehboob9/salary-dataset-of-business-levels"
output_dir <- "./raw_data"
zip_file <- file.path(output_dir, "archive.zip")
if (!dir.exists(output_dir)) dir.create(output_dir, recursive = TRUE)
# Write your bash commands and run them  
# CURL command for downloading the dataset
curl_command <- sprintf("curl -L -o %s %s", shQuote(zip_file), shQuote(kaggle_url))

# Run the CURL command
system(paste(shQuote(git_bash_path), "-c", shQuote(curl_command)), intern = TRUE)

# Unzip command
unzip_command <- sprintf("unzip -o %s -d %s", shQuote(zip_file), shQuote(output_dir))

# Run the Unzip command
system(paste(shQuote(git_bash_path), "-c", shQuote(unzip_command)), intern = TRUE)

# Load the dataset
library(readr)
salary_csv <- file.path(output_dir, "salary.csv")

# Define relative path to the dataset
salary_df <- read_csv(salary_csv)


print(head(salary_df))

