# Initialize BLS object
BLS <- list()

# Add BLS API url
BLS$url <- "https://api.bls.gov/publicAPI/v2/timeseries/data/"

# Add CPI: Urban Consumer Series ID
BLS$cpi <- "CUUR0000SA0"

# Add ECI Series ID
BLS$eci <- "CIS1010000000000I"

# Initialize BLS key
BLS$key <- NA

# Save object
usethis::use_data(BLS, overwrite = TRUE)
