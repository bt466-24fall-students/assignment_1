
library(readr)

# Define paths for downloading and reading data
raw_data <- "raw_data"
dataset_url <- "https://data.iowa.gov/api/views/qd3t-kfqg/rows.csv?accessType=DOWNLOAD"

# Define file path for dataset
dataset_path <- file.path(raw_data, "Iowa_Economic_Indicators.csv")

#Create raw_data folder if not already created
if (!dir.exists(raw_data)) {
  dir.create(raw_data)
}

# Check if dataset downloaded, if not download
if (!file.exists(dataset_path)) {
  download.file(dataset_url, dataset_path, mode = "wb")
}

# Read the CSV file
Iowa_Economic_Indicators <- read_csv(dataset_path)

# Print first 5 rows of dataset to make sure script is working
print(head(Iowa_Economic_Indicators, 5))

