#Loads the readr library
library(readr)



# setting download path as the raw data folder
download_path <- "raw_data/sales_data.csv"

# storing dataset url in variable
dataset_link <- "https://docs.google.com/spreadsheets/d/e/2PACX-1vRgpIxJreICLSslDONRupncn6mgOC7EoQXprYjsD1Pk5-lE4t7xNFQG2Y14o5iaaWiF1WlrSmVRmaTV/pub?output=csv"




# Download the dataset
download.file(dataset_link, download_path, mode = "wb")



# Read the dataset into a data frame with a clear, concise name
Sales_data <- readr::read_csv(download_path)

# Print the first few rows to confirm the data loaded successfully (optional)
print(head(Sales_data))


