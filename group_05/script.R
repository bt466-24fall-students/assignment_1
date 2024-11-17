# Path to Git Bash on your computer
git_bash_path <- "C:/Program Files/Git/git-bash.exe"

# Write your bash commands and run them  
curl_command <- "curl -L -o ./raw_data/archive.zip https://www.kaggle.com/api/v1/datasets/download/taseermehboob9/salary-dataset-of-business-levels"
system(paste(shQuote(git_bash_path), 
             "-c", 
             shQuote(curl_command)), 
       intern = TRUE)

unzip_command <- "unzip -o ./raw_data/archive.zip -d ./salary"
system(paste(shQuote(git_bash_path), 
             "-c", 
             shQuote(unzip_command)), 
       intern = TRUE)

# Load necessary package
library(readr)

# Load the dataset
data_frame_name <- read_csv("salary/salary.csv")

# Confirm data is loaded
print(head(data_frame_name))

