#### Library ####

# If the package is installed already, you may...
library(bls4R)

# Or, install from Github
library(devtools)
devtools::install_github("GuyWithGlasses00/bls4R")

#### Inputs ####

# View some options for series
BLS_SERIES |>
  View()

# Declare your API key
api_key <- "YOUR_API_KEY"

# Declare your series ID (or list of series IDs)
series <- BLS_SERIES[item_name=="Legal services", item_code]

# Declare your start year (inclusive)
start_year <- 2014

# Declare your end year (inclusive)
end_year <- 2023

#### Request ####

# Initialize BLS object
BLS <- bls4R::bls_create()

# Set BLS API key
BLS <- bls4R::bls_set_key(BLS, api_key)

# Build query
query <- bls4R::bls_query(BLS=BLS, series=series, start_year=start_year, end_year=end_year)

# Send request
request <- bls4R::bls_request(query=query)

# Extract data
bls_data <- bls4R::bls_extract(request=request)

# Append series id column
bls_data[, series_id := series]

# Or, this does the same thing but can take a list of series
bls_data <- bls4R::bls_requests(BLS=BLS,series=series, start_year=start_year, end_year=end_year)
