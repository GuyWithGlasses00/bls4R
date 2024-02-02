#### Library ####

library(bls4R)

#### Inputs ####

# View some options for series
BLS_SERIES |>
  View()

series <- BLS_SERIES[item_name=="Legal services", item_code]

start_year <- 2014

end_year <- 2023

#### Request ####

# Build query
query <- bls4R::bls_query(series=series, start_year=start_year, end_year=end_year)

# Send request
request <- bls4R::bls_request(query=query)

# Extract data
bls_data <- bls4R::bls_extract(request=request)

# Append series id column
bls_data[, series_id := series]

# Or, this does the same thing but can take a list of series
bls_data <- bls4R::bls_requests(series=series, start_year=start_year, end_year=end_year)
