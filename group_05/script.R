# Function to detect and return the appropriate shell
get_shell_path <- function() {
  if (.Platform$OS.type == "windows") {
    paths <- Sys.getenv("PATH")
    path_list <- strsplit(paths, .Platform$path.sep)[[1]]
    
    for (path in path_list) {
      possible_path <- file.path(path, "git-bash.exe")
      if (file.exists(possible_path)) {
        return(possible_path) # Return immediately if found
      }
    }
    stop("Git Bash not found. Please ensure Git is installed and added to PATH.")
  } else {
    # On Unix-based systems (macOS/Linux), return the default shell
    return("/bin/bash")
  }
}


# Get the appropriate shell path
shell_path <- get_shell_path()

# Define the Kaggle dataset URL and file paths
kaggle_url <- "https://www.kaggle.com/api/v1/datasets/download/taseermehboob9/salary-dataset-of-business-levels"
output_dir <- "./raw_data"
zip_file <- file.path(output_dir, "archive.zip")
unzip_dir <- "./raw_data"

# Create directories if they don't exist
if (!dir.exists(output_dir)) dir.create(output_dir, recursive = TRUE)
if (!dir.exists(unzip_dir)) dir.create(unzip_dir, recursive = TRUE)

# CURL command for downloading the dataset
curl_command <- sprintf("curl -L -o %s %s", shQuote(zip_file), shQuote(kaggle_url))

# Run the CURL command
system(paste(shQuote(shell_path), "-c", shQuote(curl_command)), intern = TRUE)

# Unzip command
unzip_command <- sprintf("unzip -o %s -d %s", shQuote(zip_file), shQuote(unzip_dir))

# Run the Unzip command
system(paste(shQuote(shell_path), "-c", shQuote(unzip_command)), intern = TRUE)

# Load the dataset
library(readr)
csv_file <- file.path(unzip_dir, "salary.csv")

if (file.exists(csv_file)) {
  data_frame_name <- read_csv(csv_file)
  # Confirm data is loaded
  print(head(data_frame_name))
} else {
  stop("CSV file not found. Please check the download and extraction process.")
}

